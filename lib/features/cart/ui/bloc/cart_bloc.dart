import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/features/cart/data/cart_repository.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';
import 'package:netgeek/features/products/models/product.dart';

part 'cart_bloc.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.fetchItems() = _FetchItems;

  const factory CartEvent.addItem({
    required Product product,
  }) = _AddItemEvent;

  const factory CartEvent.removeItem({
    required int productId,
  }) = _RemoveItemEvent;

  const factory CartEvent.changeQuantity({
    required ProductCartItem product,
    required int quantity,
  }) = _ChangeQuantityEvent;

  const factory CartEvent.clear() = _ClearEvent;
}

@freezed
class CartState with _$CartState {
  factory CartState.idle({
    @Default([]) List<ProductCartItem> products,
  }) = CartIdleState;

  factory CartState.loading({
    @Default([]) List<ProductCartItem> products,
  }) = CartLoadingState;

  factory CartState.changed({
    required List<ProductCartItem> products,
  }) = CartChangedState;

  factory CartState.error({
    required Exception exception,
    @Default([]) List<ProductCartItem> products,
  }) = CartErrorState;
}

@lazySingleton
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _repository;

  CartBloc(this._repository) : super(CartState.idle()) {
    on<CartEvent>(
      (event, emitter) => event.map(
        fetchItems: (event) => _fetchItems(event, emitter),
        addItem: (event) => _addItem(event, emitter),
        changeQuantity: (event) => _updateQuantity(event, emitter),
        removeItem: (event) => _removeItem(event, emitter),
        clear: (_) => _clearAll(_, emitter),
      ),
    );
  }

  Future<void> _fetchItems(
    _FetchItems event,
    Emitter<CartState> emitter,
  ) async {
    try {
      final items = await _repository.fetchCartItems();
      emitter(CartState.changed(products: items));
    } catch (e) {
      emitter(
        CartState.error(
          exception: Exception('Error when receiving data'),
          products: state.products,
        ),
      );
    } finally {
      emitter(
        CartState.idle(
          products: state.products,
        ),
      );
    }
  }

  Future<void> _addItem(
    _AddItemEvent event,
    Emitter<CartState> emitter,
  ) async {
    try {
      final product = event.product;
      await _repository.addItemToCart(
        ProductCartItem(
          id: product.id,
          name: product.name,
          picture: product.image ?? '',
          price: double.parse(product.price),
          quantity: product.quantity,
        ),
      );
      add(const CartEvent.fetchItems());
    } catch (e) {
      emitter(
        CartState.error(
          exception: Exception('Error when adding data'),
          products: state.products,
        ),
      );
    } finally {
      emitter(
        CartState.idle(
          products: state.products,
        ),
      );
    }
  }

  Future<void> _updateQuantity(
    _ChangeQuantityEvent event,
    Emitter<CartState> emitter,
  ) async {
    final product = event.product;

    await _repository.updateItemQuantity(
      product.copyWith(quantity: event.quantity),
    );
  }

  void _removeItem(
    _RemoveItemEvent event,
    Emitter<CartState> emitter,
  ) async {
    try {
      final productId = event.productId;
      await _repository.removeItem(
        productId,
      );
      emitter(
        CartState.changed(
          products: state.products
            ..removeWhere((element) => element.id == productId),
        ),
      );
    } on Exception catch (e) {
      emitter(
        CartState.error(
          exception: e,
          products: state.products,
        ),
      );
    } finally {
      emitter(
        CartState.idle(
          products: state.products,
        ),
      );
    }
  }

  Future<void> _clearAll(
    _,
    Emitter<CartState> emitter,
  ) async {
    try {
      await _repository.removeAll();
      emitter(CartState.changed(products: []));
    } on Exception catch (e) {
      emitter(
        CartState.error(
          exception: e,
          products: state.products,
        ),
      );
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';
import 'package:netgeek/features/products/models/product.dart';

part 'cart_bloc.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.fetchItems({
    required Product product,
  }) = _AddItemEvent;

  const factory CartEvent.addItem({
    required Product product,
  }) = _AddItemEvent;

  const factory CartEvent.removeItem({
    required Product product,
  }) = _RemoveItemEvent;

  const factory CartEvent.changeQuantity({
    required Product product,
    required int quantity,
  }) = _ChangeQuantityEvent;

  const factory CartEvent.clear() = _ClearEvent;
}

@freezed
class CartState with _$CartState {
  factory CartState.idle() = CartIdleState;

  factory CartState.loading() = CartLoadingState;

  factory CartState.changed({
    required List<ProductCartItem> products,
  }) = CartChangedState;

  factory CartState.error({required Exception exception}) = CartErrorState;
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.idle());
}

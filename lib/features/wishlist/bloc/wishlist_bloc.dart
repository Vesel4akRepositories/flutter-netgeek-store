import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/features/products/models/product.dart';
import 'package:netgeek/features/wishlist/logic/wishlist_repository.dart';
import 'package:netgeek/features/wishlist/models/wishlist_item.dart';

part 'wishlist_bloc.freezed.dart';

@freezed
class WishlistEvent with _$WishlistEvent {
  const factory WishlistEvent.fetchItems() = _Fetchfavourites;

  const factory WishlistEvent.addItem({
    required Product product,
  }) = _AddItemEvent;

  const factory WishlistEvent.removeItem({
    required int productId,
  }) = _RemoveItemEvent;
}

@freezed
class WishlistState with _$WishlistState {
  factory WishlistState.idle({
    @Default([]) List<WishlistItem> favourites,
  }) = _WishlistIdleState;

  factory WishlistState.changed({
    required List<WishlistItem> favourites,
  }) = _WishlistChangedState;

  factory WishlistState.error({
    required Exception exception,
    @Default([]) List<WishlistItem> favourites,
  }) = _WishlistErrorState;
}

@lazySingleton
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository _repository;

  WishlistBloc(this._repository) : super(WishlistState.idle()) {
    on<WishlistEvent>(
      (event, emitter) => event.map(
        fetchItems: (event) => _fetchFavourites(event, emitter),
        addItem: (event) => _addItem(event, emitter),
        removeItem: (event) => _removeItem(event, emitter),
      ),
    );
  }

  Future<void> _fetchFavourites(
    _Fetchfavourites event,
    Emitter<WishlistState> emitter,
  ) async {
    try {
      final favourites = await _repository.fetchItems();
      emitter(WishlistState.changed(favourites: favourites));
    } catch (e) {
      emitter(
        WishlistState.error(
          exception: Exception('Error when receiving data'),
          favourites: state.favourites,
        ),
      );
    } finally {
      emitter(
        WishlistState.idle(
          favourites: state.favourites,
        ),
      );
    }
  }

  Future<void> _addItem(
    _AddItemEvent event,
    Emitter<WishlistState> emitter,
  ) async {
    try {
      final product = event.product;
      await _repository.addItem(
        WishlistItem(
          id: product.id,
          name: product.name,
          picture: product.image ?? '',
          price: double.parse(product.price),
        ),
      );
      add(const WishlistEvent.fetchItems());
    } catch (e) {
      emitter(
        WishlistState.error(
          exception: Exception('Error when adding data'),
          favourites: state.favourites,
        ),
      );
    } finally {
      emitter(
        WishlistState.idle(
          favourites: state.favourites,
        ),
      );
    }
  }

  void _removeItem(
    _RemoveItemEvent event,
    Emitter<WishlistState> emitter,
  ) async {
    try {
      final productId = event.productId;
      await _repository.removeItem(
        productId,
      );

      final favourites = [...state.favourites];
      emitter(
        WishlistState.changed(
          favourites: favourites
            ..removeWhere((element) => element.id == productId),
        ),
      );
    } on Exception catch (e) {
      emitter(
        WishlistState.error(
          exception: e,
          favourites: state.favourites,
        ),
      );
    } finally {
      emitter(
        WishlistState.idle(
          favourites: state.favourites,
        ),
      );
    }
  }
}

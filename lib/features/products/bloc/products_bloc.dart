import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/util/handlers/exception_handler.dart';
import 'package:netgeek/features/products/data/products_repository.dart';
import 'package:netgeek/features/products/models/product.dart';

part 'products_bloc.freezed.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.fetch({
    required int categoryId,
  }) = _FetchEvent;
}

@freezed
class ProductsState with _$ProductsState {
  ProductsState._();

  bool get isFetching => maybeMap(
        fetching: (_) => true,
        orElse: () => false,
      );

  factory ProductsState.idle({
    @Default([]) List<Product> products,
  }) = ProductsIdleState;

  factory ProductsState.fetching({
    @Default([]) List<Product> products,
  }) = ProductsFetchingState;

  factory ProductsState.fetched({
    required List<Product> products,
  }) = ProductsFetchedState;

  factory ProductsState.error({
    required Exception exception,
    @Default([]) List<Product> products,
  }) = ProductsErrorState;
}

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _repository;

  ProductsBloc(this._repository) : super(ProductsState.idle()) {
    on<ProductsEvent>(
      (event, emitter) => event.map(
        fetch: (event) => _fetch(event, emitter),
      ),
    );
  }

  void _fetch(
    _FetchEvent event,
    Emitter<ProductsState> emitter,
  ) async {
    try {
      emitter(ProductsState.fetching());
      final products = await _repository.fetchProducts(event.categoryId);
      emitter(ProductsState.fetched(products: products));
    } catch (e,st) {
      emitter(
        ProductsState.error(
          exception: ExceptionHandler.handleError(e),
        ),
      );
    }
  }
}

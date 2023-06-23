import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/util/handlers/exception_handler.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';
import 'package:netgeek/features/checkout/data/checkout_repository.dart';
import 'package:netgeek/features/products/models/product.dart';

part 'checkout_bloc.freezed.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.onPayment({
    required List<ProductCartItem> cartItems,
  }) = _PayEvent;
}

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.idle() = CheckoutInitialState;

  const factory CheckoutState.loading() = CheckoutLoadingState;

  const factory CheckoutState.success() = CheckoutSuccessState;

  const factory CheckoutState.error({required Exception exception}) =
      CheckoutErrorState;
}

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository _repository;

  CheckoutBloc(
    this._repository,
  ) : super(const CheckoutState.idle()) {
    on<CheckoutEvent>(
      (event, emitter) => event.map<Future<void>>(
        onPayment: (event) => _createOrder(event, emitter),
      ),
    );
  }

  Future<void> _createOrder(
      _PayEvent event, Emitter<CheckoutState> emitter) async {
    try {
      emitter(const CheckoutState.loading());

      await _repository.createOrder(
        event.cartItems,
      );

      emitter(const CheckoutState.success());
    } catch (error) {
      emitter(
        CheckoutState.error(
          exception: ExceptionHandler.handleError(error),
        ),
      );
      rethrow;
    }
  }
}

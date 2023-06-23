import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/cart/ui/bloc/cart_bloc.dart';
import 'package:netgeek/features/checkout/bloc/checkout_bloc.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final _cartBloc = context.read<CartBloc>();

  void _onPayOrder() {
    context.read<CheckoutBloc>().add(
          CheckoutEvent.onPayment(
            cartItems: _cartBloc.state.products,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text('Checkout'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(kPadding),
              Text(
                'Итог: ${_cartBloc.state.products.fold(
                  0.0,
                  (previousValue, element) =>
                      previousValue + element.price * element.quantity,
                )}',
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _onPayOrder,
                child: const Text('Оплатить'),
              ),
              const Gap(kPadding),
            ],
          ),
        ),
      ),
    );
  }
}

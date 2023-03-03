import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/dialogs/dialogs_manager.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';
import 'package:netgeek/features/cart/ui/bloc/cart_bloc.dart';
import 'package:netgeek/features/cart/ui/views/cart_item_view.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _onError(Exception exception) {
    DialogsManager.of(context).showError(exception: exception);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (_, state) {
        state.maybeMap(
          error: (state) => _onError(state.exception),
          orElse: () {},
        );
      },
      builder: (_, state) {
        final cartItems = state.products;

        return cartItems.isEmpty
            ? const Center(
                child: Text('Cart is empty'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: ListView.separated(
                  itemCount: cartItems.length,
                  itemBuilder: (_, index) => CartItemView(
                    product: cartItems[index],
                    onRemoveItem: (int) {},
                    onUpdateQuantity: (ProductCartItem item, int quantity) {},
                  ),
                  separatorBuilder: (_, __) => const Gap(kPadding),
                ),
              );
      },
    );
  }
}

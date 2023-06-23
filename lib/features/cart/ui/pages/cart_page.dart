import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/injection/injection.dart';
import 'package:netgeek/core/widget/dialogs/dialogs_manager.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';
import 'package:netgeek/features/cart/ui/bloc/cart_bloc.dart';
import 'package:netgeek/features/cart/ui/views/cart_item_view.dart';
import 'package:netgeek/features/checkout/bloc/checkout_bloc.dart';
import 'package:netgeek/features/checkout/ui/pages/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc get _cartBloc => context.read<CartBloc>();

  void _onError(Exception exception) {
    DialogsManager.of(context).showError(exception: exception);
  }

  void _onUpdateProductQuantity(
    ProductCartItem item,
    int quantity,
  ) {
    _cartBloc.add(
      CartEvent.changeQuantity(
        product: item,
        quantity: quantity,
      ),
    );
  }

  void _onClearCart() => _cartBloc.add(const CartEvent.clear());

  void _onCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<CheckoutBloc>(),
          child: const CheckoutPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: BlocConsumer<CartBloc, CartState>(
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
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(kPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Моя корзина',
                                  style: textTheme.headlineSmall,
                                ),
                                IconButton(
                                  onPressed: _onClearCart,
                                  icon: const Icon(Icons.remove_circle),
                                ),
                              ],
                            ),
                            const Gap(kPadding),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cartItems.length,
                          (_, index) => Padding(
                            padding: const EdgeInsets.only(bottom: kPadding),
                            child: CartItemView(
                              product: cartItems[index],
                              onRemoveItem: (int) {},
                              onUpdateQuantity: _onUpdateProductQuantity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: ElevatedButton(
          onPressed: _onCheckout,
          child: const Text('Купить'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/cart/ui/bloc/cart_bloc.dart';
import 'package:netgeek/features/products/models/product.dart';
import 'package:netgeek/features/products/ui/views/heart_button.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with ProductDetailsMixin {
  Product get product => widget.product;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          HeartButton(
            product: product,
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _onShare(product),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(color: Colors.white),
              child: Image.network(product.image ?? ''),
            ),
            const Gap(kPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: themeData.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '${product.price} руб.',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    'На складе: ${product.quantity}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(kPadding),
                  Text(
                    product.desc,
                    style: themeData.textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: ElevatedButton(
          onPressed: () => _addToCart(
            context,
            product: product,
            quantity: 1,
          ),
          child: const Text('Add to cart'),
        ),
      ),
    );
  }
}

mixin ProductDetailsMixin {
  void _onShare(Product product) {
    Share.share(
        'Хочу поделиться с тобой одним интересным продуктом, его можно приобрести в магазине netgeek: ${product.toString()}');
  }

  void _addToCart(
    BuildContext context, {
    required Product product,
    required int quantity,
  }) =>
      context.read<CartBloc>().add(
            CartEvent.addItem(
              product: product,
              quantity: quantity,
            ),
          );
}

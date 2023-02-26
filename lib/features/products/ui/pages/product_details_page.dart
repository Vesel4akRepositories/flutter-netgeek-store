import 'package:flutter/material.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/products/models/product.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Product get product => widget.product;

  void _onShare() {
    Share.share(
        'Хочу поделиться с тобой одним интересным продуктом, его можно приобрести в магазине netgeek: ${product.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _onShare,
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
                    'Совсем немного: ${product.quantity}',
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
    );
  }
}

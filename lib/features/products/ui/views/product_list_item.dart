import 'package:flutter/material.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/products/models/product.dart';
import 'package:netgeek/features/products/ui/pages/product_details_page.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final _itemHeight = 230.0;

  const ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  void _openProductDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openProductDetails(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: _itemHeight,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Image.network(
              product.image ?? '',
              height: _itemHeight,

              fit: BoxFit.cover,
            ),
          ),
          const Gap(kPadding / 2),
          Text(
            product.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '${product.price} руб.',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/features/categories/models/category.dart';
import 'package:netgeek/features/products/bloc/products_bloc.dart';
import 'package:netgeek/features/products/ui/views/product_list_item.dart';

class ProductsPage extends StatelessWidget {
  final Category category;

  const ProductsPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Column(
        children: [

          BlocConsumer<ProductsBloc, ProductsState>(
            listener: (_, state) {},
            builder: (_, state) {
              if (state.isFetching) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final products = state.products;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: products.length,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ProductListItem(
                      product: products[index],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/injection/injection.dart';
import 'package:netgeek/features/categories/models/category.dart';
import 'package:netgeek/features/products/bloc/products_bloc.dart';
import 'package:netgeek/features/products/ui/pages/products_page.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;

  final _itemHeight = 150.0;

  const CategoryListItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  void _openCategoryProducts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<ProductsBloc>()
            ..add(
              ProductsEvent.fetch(categoryId: category.id),
            ),
          child: ProductsPage(category: category),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCategoryProducts(context),
      child: Container(
        height: _itemHeight,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(3, 0),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Image.network(
                category.icon ?? '',
                height: _itemHeight,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

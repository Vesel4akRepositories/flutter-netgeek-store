import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/features/products/models/product.dart';
import 'package:netgeek/features/wishlist/bloc/wishlist_bloc.dart';

class HeartButton extends StatelessWidget {
  final Product product;

  const HeartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistBloc = context.read<WishlistBloc>();
    return BlocBuilder<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      builder: (_, state) {
        final isExist =
            state.favourites.indexWhere((item) => item.id == product.id) != -1;

        if (!isExist) {
          return IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              wishlistBloc.add(
                WishlistEvent.addItem(product: product),
              );
            },
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: 16.0,
              ),
            ),
          );
        }

        return IconButton(
          splashColor: Colors.transparent,
          onPressed: () {
            wishlistBloc.add(
              WishlistEvent.removeItem(productId: product.id),
            );
          },
          icon: CircleAvatar(
            backgroundColor: Colors.red.withOpacity(0.1),
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 16.0,
            ),
          ),
        );
      },
    );
  }
}

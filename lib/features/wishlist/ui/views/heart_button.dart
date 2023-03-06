import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:netgeek/features/wishlist/models/wishlist_item.dart';

class HeartButton extends StatelessWidget {
  final WishlistItem product;

  const HeartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (_, state) {
          return GestureDetector(
            onTap: () {
              context.read<WishlistBloc>().add(
                WishlistEvent.removeItem(productId: product.id),
              );
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.black,
              size: 16.0,
            ),
          );
        },
      ),
    );
  }
}

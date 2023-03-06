import 'package:flutter/material.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/wishlist/models/wishlist_item.dart';
import 'package:netgeek/features/wishlist/ui/views/heart_button.dart';

class WishlistItemView extends StatelessWidget {
  final WishlistItem item;

  const WishlistItemView({
    Key? key,
    required this.item,
  }) : super(key: key);

  final _itemHeight = 130.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            Image.network(
              item.picture,
              width: _itemHeight,
              height: _itemHeight,
              fit: BoxFit.contain,
            ),
            const Gap(kPadding),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        HeartButton(
                          product: item,
                        ),
                      ],
                    ),
                    const Gap(kPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${item.price} руб.',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Gap(11),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

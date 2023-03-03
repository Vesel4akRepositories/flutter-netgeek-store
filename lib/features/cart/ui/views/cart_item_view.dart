import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';

typedef OnRemoveCartItem = Function(int);
typedef OnUpdateQuantity = Function(ProductCartItem item, int quantity);

class CartItemView extends StatelessWidget {
  final ProductCartItem product;
  final OnRemoveCartItem onRemoveItem;
  final OnUpdateQuantity onUpdateQuantity;

  const CartItemView({
    Key? key,
    required this.product,
    required this.onRemoveItem,
    required this.onUpdateQuantity,
  }) : super(key: key);

  final _itemHeight = 150.0;

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
              product.picture,
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
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Gap(kPadding),
                    Row(
                      children: [
                        _QuantityControlsView(
                          product: product,
                          updateQuantity: onUpdateQuantity,
                          onRemove: onRemoveItem,
                        ),
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

class _QuantityControlsView extends StatefulWidget {
  final ProductCartItem product;
  final OnUpdateQuantity updateQuantity;
  final OnRemoveCartItem onRemove;

  const _QuantityControlsView({
    Key? key,
    required this.product,
    required this.updateQuantity,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<_QuantityControlsView> createState() => _QuantityControlsViewState();
}

class _QuantityControlsViewState extends State<_QuantityControlsView> {
  int _quantity = 1;

  ProductCartItem get product => widget.product;

  @override
  void initState() {
    super.initState();
    _quantity = product.quantity;
  }

  void _increment() {
    setState(() {
      _quantity++;
      widget.updateQuantity(product, _quantity);
    });
  }

  void _decrement() {
    if (_quantity - 1 != 0) {
      setState(() {
        _quantity--;
        widget.updateQuantity(product, _quantity);
      });
    } else {
      widget.onRemove(product.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _QuantityIncrementButton(
              iconData: CupertinoIcons.minus,
              onPressed: _decrement,
            ),
            const Gap(10),
            Text(_quantity.toString()),
            const Gap(10),
            _QuantityIncrementButton(
              iconData: CupertinoIcons.plus,
              onPressed: _increment,
            ),
          ],
        ),
      ],
    );
  }
}

class _QuantityIncrementButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const _QuantityIncrementButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: IconButton(
        highlightColor: Colors.transparent,
        icon: Icon(
          iconData,
          color: Colors.white,
          size: 15,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

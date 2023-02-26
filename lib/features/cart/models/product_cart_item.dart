import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_cart_item.freezed.dart';
part 'product_cart_item.g.dart';

@freezed
class ProductCartItem with _$ProductCartItem {
  const factory ProductCartItem({
    required int id,
    required int name,
    required String price,
    required int quantity,
  }) = _ProductCartItem;

  factory ProductCartItem.fromJson(Map<String, dynamic> json) =>
      _$ProductCartItemFromJson(json);
}

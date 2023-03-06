import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_item.freezed.dart';
part 'wishlist_item.g.dart';

@freezed
class WishlistItem with _$WishlistItem {
  const factory WishlistItem({
    required int id,
    required String name,
    required String picture,
    required double price,
  }) = _WishlistItem;

  factory WishlistItem.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemFromJson(json);
}
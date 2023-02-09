import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Product({
    required int id,
    required String name,
    required String desc,
    required String price,
    required int quantity,
    required int category,
    required String createdAt,
    required String updatedAt,
    String? image,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

part 'category.g.dart';

@freezed
class Category with _$Category {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Category({
    required int id,
    required String name,
    required String createdAt,
    String? updatedAt,
    String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

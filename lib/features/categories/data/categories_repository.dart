import 'package:injectable/injectable.dart';
import 'package:netgeek/core/network/api_helper.dart';
import 'package:netgeek/features/categories/models/category.dart';

@injectable
class CategoriesRepository {
  final HttpManager _httpManager;

  CategoriesRepository(this._httpManager);

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await _httpManager.get('products/categories');

      final categories =
          response.data.map<Category>((value) => Category.fromJson(value)).toList();

      return categories;
    } catch (_) {
      rethrow;
    }
  }
}

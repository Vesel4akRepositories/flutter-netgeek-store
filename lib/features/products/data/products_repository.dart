import 'package:injectable/injectable.dart';
import 'package:netgeek/core/network/api_helper.dart';
import 'package:netgeek/features/products/models/product.dart';

@injectable
class ProductsRepository {
  final HttpManager _httpManager;

  ProductsRepository(this._httpManager);

  Future<List<Product>> fetchProducts(int categoryId) async {
    try {
      final response =
          await _httpManager.get('products/category/$categoryId');

      final products = response.data
          .map<Product>((value) => Product.fromJson(value))
          .toList();

      return products;
    } catch (_) {
      rethrow;
    }
  }
}

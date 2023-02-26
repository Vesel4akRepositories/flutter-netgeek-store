import 'package:injectable/injectable.dart';
import 'package:netgeek/core/storage/database.dart';
import 'package:netgeek/features/products/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CartRepository {
  late final SharedPreferences _sharedPrefs;

//  final AppDb appDb;

  CartRepository();
  Future<List<Product>> fetchCartItems() async {
    try {
      //final itemsRawString = _sharedPrefs.();

     // final items = appDb.cart;
      return [];
    } catch (_) {
      rethrow;
    }
  }
}

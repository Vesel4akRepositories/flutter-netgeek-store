import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/storage/database.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';

@injectable
class CartRepository {
  final AppDb _appDb;

  CartRepository(this._appDb);

  Future<List<ProductCartItem>> fetchCartItems() async {
    try {
      final items = await _appDb.cartEntries.select().get();

      final products = items
          .map<ProductCartItem>(
            (e) => ProductCartItem(
              id: e.id,
              name: e.name,
              picture: e.picture,
              price: e.price,
              quantity: e.quantity,
            ),
          )
          .toList();

      return products;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> addItemToCart(ProductCartItem item) async {
    try {
      await _appDb.cartEntries.insertOne(
        CartEntry.fromJson(item.toJson()),
        mode: InsertMode.insertOrIgnore,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updateItemQuantity(ProductCartItem item) async {
    try {
      return _appDb.cartEntries.replaceOne(
        CartEntry.fromJson(
          item.toJson(),
        ),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> removeItem(int itemId) async {
    try {
      await _appDb.cartEntries.deleteWhere((tbl) => tbl.id.equals(itemId));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> removeAll() async {
    try {
      await _appDb.cartEntries.deleteAll();
    } catch (_) {
      rethrow;
    }
  }
}

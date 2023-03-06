import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/storage/database.dart';
import 'package:netgeek/features/wishlist/models/wishlist_item.dart';

@injectable
class WishlistRepository {
  final AppDb _appDb;

  WishlistRepository(this._appDb);

  Future<List<WishlistItem>> fetchItems() async {
    try {
      final items = await _appDb.wishlistEntries.select().get();

      final favourites = items
          .map<WishlistItem>(
            (e) => WishlistItem.fromJson(
              e.toJson(),
            ),
          )
          .toList();

      return favourites;
    } catch (_) {
      print(_);
      rethrow;
    }
  }

  Future<void> addItem(WishlistItem item) async {
    try {
      await _appDb.wishlistEntries.insertOne(
        WishlistEntry.fromJson(item.toJson()),
        mode: InsertMode.insertOrIgnore,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> removeItem(int itemId) async {
    try {
      await _appDb.wishlistEntries.deleteWhere((tbl) => tbl.id.equals(itemId));
    } catch (_) {
      rethrow;
    }
  }
}

import 'package:drift/drift.dart';

@DataClassName('CartEntry')
class CartEntries extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get picture => text()();

  RealColumn get price => real()();

  IntColumn get quantity => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('WishlistEntry')
class WishlistEntries extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get picture => text()();

  RealColumn get price => real()();

  @override
  Set<Column> get primaryKey => {id};
}

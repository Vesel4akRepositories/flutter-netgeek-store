import 'package:drift/drift.dart';

@DataClassName('CartEntry')
class CartEntries extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get picture => text()();
  RealColumn get price => real()();
  IntColumn get quantity => integer()();
}

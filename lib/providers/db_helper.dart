import 'dart:math';

import 'package:sokeun/model/gift_card_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return _db;
  }

  Future<void> close() async {
    var dbClient = await db;
    await dbClient!.close();
    _db = null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'gift_cards.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE gift_cards (id INTEGER PRIMARY KEY, giftId VARCHAR UNIQUE, giftName TEXT, giftPointNumber INTEGER, giftQuantity INTEGER, giftPoint TEXT, giftPointButton TEXT)');
  }

  Future<GiftCardModel> insert(GiftCardModel giftCard) async {
    print(giftCard.toJson());
    var dbClient = await db;
    await dbClient!.insert('gift_cards', giftCard.toJson());
    return giftCard;
  }

  Future<List> getGiftCardList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('gift_cards');
    return queryResult.map((e) => GiftCardModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!
        .delete('gift_cards', where: 'id = ?', whereArgs: [id]);
  }

  String generateUniqueId() {
    var random = Random();
    return '${random.nextInt(999)}-${random.nextInt(999)}-${random.nextInt(999)}';
  }

  Future<int> updateQuantity(GiftCardModel giftCard) async {
    var dbClient = await db;
    return await dbClient!.update('gift_cards', giftCard.toJson(),
        where: 'id = ?', whereArgs: [giftCard.id]);
  }
}

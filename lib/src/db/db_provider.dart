import 'package:news_apps_flutter/src/core/constants.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DbProvider {
  Database db;
  DbProvider() {
    init();
  }
  init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, APP_DB);
    db = await openDatabase(path, version: 1,
        onCreate: (Database database, int verion) {
      Batch batch = database.batch();
      batch.execute("""
      CREATE TABLE $TABLE_NAME(
        id INTEGER PRIMARY KEY,
        by TEXT,
        descendants INTEGER,
        score INTEER,
        text TEXT,
        time INTEGER,
        title TEXT,
        type TEXT,
        url TEXT,
        kids BLOB,
        deleted INTEGER,
        dead INTEER,
        parent INTEGER
      )
      """);
      batch.commit();
    });
  }

  insertItem(ItemModel itemModel) {
    return db.insert(TABLE_NAME, itemModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // insert into Items() values()
  }

  fetchItem(int id) async {
    // select * from Item Where id = :id
    final data = await db.query(TABLE_NAME,
        columns: ['*'], where: "id = ?", whereArgs: [id]);

    return (data != null) ? ItemModel.fromDb(data.first) : null;
  }
}

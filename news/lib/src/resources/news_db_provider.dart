import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'dart:io';
import 'package:path/path.dart' show join;
import '../models/item_model.dart';
import 'repository.dart' show Source, Cache;

class NewsDbProvider implements Cache, Source {
  Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'items.db');
    bool exists = await databaseExists(path);
    if (exists) {
      return;
    }

    db = await openDatabase(
      path,
      version: 1,
      onConfigure: (Database newDb) {
        newDb.execute('''
        CREATE TABLE Items
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
        ''');
      },
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db
        .query('Items', columns: null, where: 'id = ?', whereArgs: [id]);

    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }


  @override
  Future<int> addItem(ItemModel itemModel) {
    return db.insert("Items", itemModel.toMap());
  }

  @override
  Future<List<int>> fetchTopIds() {
    // TODO: Maybe store top ids?
    return null;
  }
}

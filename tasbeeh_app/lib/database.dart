import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    void _createTableSettings(Batch batch) {
      batch.execute(
        'CREATE TABLE features_setting(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, featureCode TEXT, active INTEGER, name TEXT)',
      );

      // init record settings
      batch.execute(
          "INSERT INTO features_setting ('featureCode', 'active', 'name')values (?, ?, ?)",
          ["dzikir_default", 1, 'Dzikir Reference']);
    }

    void _createTableDzikirDefault(Batch batch) async {
      batch.execute(
        'CREATE TABLE dzikirs_default(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, qty INTEGER, timer INTEGER, lastcount INTEGER)',
      );

      // init record dzikirs default
      batch.execute(
          "INSERT INTO dzikirs_default ('id', 'name', 'qty', 'timer', 'lastcount')values (?, ?, ?, ?, ?)",
          [0, "Tasbih", 33, 900, 0]);
      batch.execute(
          "INSERT INTO dzikirs_default ('id', 'name', 'qty', 'timer', 'lastcount')values (?, ?, ?, ?, ?)",
          [1, "Tahlil", 33, 900, 0]);
      batch.execute(
          "INSERT INTO dzikirs_default ('id', 'name', 'qty', 'timer', 'lastcount')values (?, ?, ?, ?, ?)",
          [2, "Takbir", 33, 900, 0]);
      batch.execute(
          "INSERT INTO dzikirs_default ('id', 'name', 'qty', 'timer', 'lastcount')values (?, ?, ?, ?, ?)",
          [3, "Tahmid", 33, 900, 0]);
    }

    return openDatabase(
      join(path, 'dzikir_database.db'),
      version: 4,
      onCreate: (database, version) async {
        var batch = database.batch();
        await database.execute(
          'CREATE TABLE dzikirs(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, qty INTEGER, timer INTEGER, lastcount INTEGER)',
        );
        _createTableDzikirDefault(batch);
        _createTableSettings(batch);
        await batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        var batch = db.batch();
        if (oldVersion == 3) {
          // We update existing table and create the new tables
          _createTableDzikirDefault(batch);
          _createTableSettings(batch);
        }
        await batch.commit();
      },
    );
  }

  Future<void> deleteDzikir(int id) async {
    final db = await initializeDB();
    await db.delete(
      'dzikirs',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> insertDzikir(List<Dzikir> dzikirs, table) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var dzikir in dzikirs) {
      result = await db.insert(table, dzikir.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  Future<int> updateDzikir(Dzikir dzikir, String dzikirType) async {
    final table = dzikirType == 'custom' ? 'dzikirs' : 'dzikirs_default';
    final db = await initializeDB();
    var result = await db
        .update(table, dzikir.toMap(), where: "id = ?", whereArgs: [dzikir.id]);
    return result;
  }

  Future retrieveDzikirs() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('dzikirs');
    return List.generate(maps.length, (i) {
      return Dzikir(
        id: maps[i]['id'],
        name: maps[i]['name'],
        qty: maps[i]['qty'],
        timer: maps[i]['timer'],
        lastcount: maps[i]['lastcount'],
      );
    });
  }

  Future<List<Dzikir>> retrieveDzikirsDefault() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('dzikirs_default');
    return List.generate(maps.length, (i) {
      return Dzikir(
        id: maps[i]['id'],
        name: maps[i]['name'],
        qty: maps[i]['qty'],
        timer: maps[i]['timer'],
        lastcount: maps[i]['lastcount'],
      );
    });
  }

  Future<int> updateSetting(Settings settings) async {
    print('settings');
    print(settings);
    final db = await initializeDB();
    var result = await db.update("features_setting", settings.toMap(),
        where: "featureCode = ?", whereArgs: [settings.featureCode]);
    return result;
  }

  Future<List<Settings>> retrieveSettings() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('features_setting');
    return List.generate(maps.length, (i) {
      return Settings(
        id: maps[i]['id'],
        featureCode: maps[i]['featureCode'],
        active: maps[i]['active'],
        name: maps[i]['name'],
      );
    });
  }

  Future<Settings> retrieveSettingsByCode(String fieldCode) async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> result = await db.query('features_setting',
        where: "featureCode = ?", whereArgs: [fieldCode]);

    return Settings(
      id: result[0]['id'],
      featureCode: result[0]['featureCode'],
      active: result[0]['active'],
      name: result[0]['name'],
    );
  }
}

class Dzikir {
  final String name;
  final int qty;
  final int timer;
  final int? lastcount;
  final int? id;

  Dzikir(
      {required this.name,
        required this.qty,
        required this.timer,
        this.lastcount,
        this.id});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'qty': qty,
      'timer': timer,
      'id': id,
      'lastcount': lastcount,
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Dzikir{id: $id, name: $name, qty: $qty, timer: $timer, lastcount: $lastcount}';
  }
}

class Settings {
  final int? id;
  final String featureCode;
  final int active;
  final String? name;

  Settings(
      {this.id, required this.featureCode, required this.active, this.name});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'featureCode': featureCode,
      'active': active,
      'id': id,
      'name': name,
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Dzikir{id: $id, name: $name, featureCode: $featureCode, active: $active}';
  }
}
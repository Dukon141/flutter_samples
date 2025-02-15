import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../ui/pages/notes/models/note.dart';

const _id = 'id';
const _title = 'title';
const _text = 'text';

class DataBaseRepository {
  final String databaseName;
  static Database? _database;

  DataBaseRepository({required this.databaseName});

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, '$databaseName.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $databaseName(
            $_id INTEGER PRIMARY KEY AUTOINCREMENT, 
            $_title TEXT, 
            $_text TEXT
          )
          ''');
      },
    );
  }

  Future<int> insertNote({required Note note}) async {
    Database db = await database;

    return await db.insert(databaseName, note.toMap());
  }

  Future<List<Note>> getNotes() async {
    Database db = await database;

    List<Map<String, dynamic>> maps = await db.query(databaseName);

    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  Future<int> updateNote({required Note note}) async {
    Database db = await database;

    return await db.update(
      databaseName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote({required Note note}) async {
    Database db = await database;

    return await db.delete(databaseName, where: 'id = ?', whereArgs: [note.id]);
  }
}

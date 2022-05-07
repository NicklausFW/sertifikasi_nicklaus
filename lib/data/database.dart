import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  DatabaseRepository._privateConstructor();

  static final DatabaseRepository instance =
      DatabaseRepository._privateConstructor();

  final _databaseName = 'database.db';
  final _databaseVersion = 1;

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String documents = await getDatabasesPath();
    String path = join(documents + _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: await _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE peminjaman (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      namaPeminjam STRING,
      tanggalPinjam STRING,
      tanggalHarusKembali STRING,
      koleksi STRING,
      FOREIGN KEY (koleksi) REFERENCES perpustakaan (judul)
      )
      ''');

    await db.execute('''
    CREATE TABLE perpustakaan (
      idBuku INTEGER PRIMARY KEY AUTOINCREMENT,
      judulBuku STRING
      )
      ''');
  }
}

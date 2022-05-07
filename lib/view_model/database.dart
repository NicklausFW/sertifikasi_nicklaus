import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Singleton
class DatabaseRepository {
  //private named constructor
  DatabaseRepository._privateConstructor();

  //referencing to instance of itself
  static final DatabaseRepository instance =
      DatabaseRepository._privateConstructor();

  final _databaseName = 'database.db';
  final _databaseVersion = 1;

  static Database? _database;

  //check if our database has been created, otherwise create a new database
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
      tanggalPinjam STRING,
      tanggalHarusKembali STRING,
      FK_anggota_perpustakaan STRING,
      FK_peminjaman_perpustakaan STRING,
      FOREIGN KEY (FK_anggota_perpustakaan) REFERENCES anggota (namaAnggota),
      FOREIGN KEY (FK_peminjaman_perpustakaan) REFERENCES perpustakaan (judulBuku)
      )
      ''');

    await db.execute('''
    CREATE TABLE perpustakaan (
      idBuku INTEGER PRIMARY KEY AUTOINCREMENT,
      judulBuku STRING
      )
      ''');

    await db.execute('''
    CREATE TABLE anggota (
      idAnggota INTEGER PRIMARY KEY AUTOINCREMENT,
      namaAnggota STRING
      )
      ''');
  }
}

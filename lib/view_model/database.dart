import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

///Singleton
class DatabaseRepository {
  ///private named constructor
  DatabaseRepository._privateConstructor();

  ///referencing to instance of itself
  static final DatabaseRepository instance =
      DatabaseRepository._privateConstructor();

  final _databaseName = 'database.db';
  final _databaseVersion = 1;
  static Database? _database;

  ///check if our database has been created, otherwise create a new database
  Future<Database> get database async => _database ??= await _initDatabase();

  ///creating database
  Future<Database> _initDatabase() async {
    String documents = await getDatabasesPath();
    String path = join(documents + _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: await _onCreate);
  }

  ///when creating the db, create the table
  Future _onCreate(Database db, int version) async {
    ///create peminjaman table
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

    ///create perpustakaan table
    await db.execute('''
    CREATE TABLE perpustakaan (
      idBuku INTEGER PRIMARY KEY AUTOINCREMENT,
      judulBuku STRING UNIQUE
      )
      ''');

    ///create anggota table
    await db.execute('''
    CREATE TABLE anggota (
      idAnggota INTEGER PRIMARY KEY AUTOINCREMENT,
      namaAnggota STRING UNIQUE
      )
      ''');
  }
}

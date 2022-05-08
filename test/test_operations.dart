import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:sertifikasi_nicklaus/models/anggota.dart';
import 'package:sertifikasi_nicklaus/models/peminjaman.dart';
import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    /// Initialize FFI
    sqfliteFfiInit();

    /// Change the default factory
    databaseFactory = databaseFactoryFfi;
  });

  ///create books
  test('create perpustakaan', () async {
    var db = await databaseFactoryFfi
        .openDatabase('../../../assets/databasesdatabase.db');

    var perpustakaan = Perpustakaan(
      judulBuku: 'Harry Potter and the Deathly Hallows',
    );

    ///insert content to table
    db.insert('perpustakaan', perpustakaan.toMap());

    ///query is select from database, consists of map of string and dynamic.
    List<Map<String, dynamic>> allRows = await db.query('perpustakaan');

    ///parse to list
    List<Perpustakaan> buku =
        allRows.map((buku) => Perpustakaan.fromMap(buku)).toList();

    expect(buku[0].judulBuku, 'Harry Potter and the Deathly Hallows');
  });

  ///create anggota
  test('create anggota', () async {
    var db = await databaseFactoryFfi
        .openDatabase('../../../assets/databasesdatabase.db');

    var anggota = Anggota(
      namaAnggota: 'Harry Potter',
    );

    ///insert content to table
    db.insert('anggota', anggota.toMap());

    ///query is select from database, consists of map of string and dynamic.
    List<Map<String, dynamic>> allRows = await db.query('anggota');

    ///parse to list
    List<Anggota> anggotaBaru =
        allRows.map((anggota) => Anggota.fromMap(anggota)).toList();

    expect(anggotaBaru[0].namaAnggota, 'Harry Potter');
  });

  ///create peminjaman
  test('create peminjaman', () async {
    DateTime now = DateTime.now();

    var db = await databaseFactoryFfi
        .openDatabase('../../../assets/databasesdatabase.db');

    var peminjaman = Peminjaman(
      FK_anggota_perpustakaan: 'Harry Potter',
      FK_peminjaman_perpustakaan: 'Harry Potter and the Deathly Hallows',
      tanggalPinjam: DateFormat('yyyy-MM-dd – kk:mm').format(now) as String,
      tanggalHarusKembali: DateFormat('yyyy-MM-dd – kk:mm')
          .format(now.add(Duration(days: 7))) as String,
    );

    db.insert('peminjaman', peminjaman.toMap());

    ///query is select from database, consists of map of string and dynamic
    List<Map<String, dynamic>> allRows = await db.query('peminjaman');

    ///parse to list
    List<Peminjaman> pinjaman =
        allRows.map((peminjaman) => Peminjaman.fromMap(peminjaman)).toList();

    expect(pinjaman[0].FK_anggota_perpustakaan, "Harry Potter");
  });

  ///select anggota
  test('select anggota', () async {
    var db = await databaseFactoryFfi
        .openDatabase('../../../assets/databasesdatabase.db');

    ///query is select from database, consists of map of string and dynamic
    List<Map<String, dynamic>> allRows = await db.query('anggota');

    ///parse to list
    List<Anggota> anggota =
        allRows.map((anggota) => Anggota.fromMap(anggota)).toList();

    expect(anggota[0].namaAnggota, "Harry Potter");
  });

  ///select books
  test('select perpustakaan', () async {
    var db = await databaseFactoryFfi
        .openDatabase('../../../assets/databasesdatabase.db');

    ///query is select from database, consists of map of string and dynamic
    List<Map<String, dynamic>> allRows = await db.query('perpustakaan');

    ///parse to list
    List<Perpustakaan> perpustakaan =
        allRows.map((buku) => Perpustakaan.fromMap(buku)).toList();

    expect(perpustakaan[0].judulBuku, "Harry Potter and the Deathly Hallows");
  });

  ///select peminjaman
  test('select peminjaman', () async {
    var db = await databaseFactoryFfi
        .openDatabase('../../../assets/databasesdatabase.db');

    ///query is select from database, consists of map of string and dynamic
    List<Map<String, dynamic>> allRows = await db.query('peminjaman');

    ///parse to list
    List<Peminjaman> peminjaman =
        allRows.map((peminjaman) => Peminjaman.fromMap(peminjaman)).toList();

    expect(peminjaman[0].FK_anggota_perpustakaan, "Harry Potter");
  });
}

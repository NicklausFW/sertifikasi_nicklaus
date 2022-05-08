import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';

import 'database.dart';

///Operation for Perpustakaan table
class OperasiPerpustakaan {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  ///insert content to table
  createPerpustakaan(Perpustakaan perpustakaan) async {
    final db = await dbRepository.database;
    db.insert('perpustakaan', perpustakaan.toMap());
  }

  ///get all content
  Future<List<Perpustakaan>> getAllPerpustakaan() async {
    final db = await dbRepository.database;
    List<Map<String, dynamic>> allRows = await db.query('perpustakaan');
    List<Perpustakaan> perpustakaan = allRows
        .map((perpustakaan) => Perpustakaan.fromMap(perpustakaan))
        .toList();
    return perpustakaan;
  }
}

import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';

import 'database.dart';

class OperasiPerpustakaan {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  createPerpustakaan(Perpustakaan perpustakaan) async {
    final db = await dbRepository.database;
    db.insert('perpustakaan', perpustakaan.toMap());
  }

  Future<List<Perpustakaan>> getAllPerpustakaan() async {
    final db = await dbRepository.database;
    List<Map<String, dynamic>> allRows = await db.query('category');
    List<Perpustakaan> perpustakaan = allRows
        .map((perpustakaan) => Perpustakaan.fromMap(perpustakaan))
        .toList();
    return perpustakaan;
  }
}

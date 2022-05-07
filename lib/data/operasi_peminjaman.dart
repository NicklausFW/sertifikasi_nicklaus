import 'package:sertifikasi_nicklaus/models/peminjaman.dart';
import 'database.dart';

class OperasiPeminjaman {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  createPeminjaman(Peminjaman peminjaman) async {
    final db = await dbRepository.database;
    db.insert('peminjaman', peminjaman.toMap());
  }

  Future<List<Peminjaman>> getAllPeminjaman() async {
    final db = await dbRepository.database;
    List<Map<String, dynamic>> allRows = await db.query('peminjaman');
    List<Peminjaman> peminjaman =
        allRows.map((peminjaman) => Peminjaman.fromMap(peminjaman)).toList();
    return peminjaman;
  }
}

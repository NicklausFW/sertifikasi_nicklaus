import 'package:sertifikasi_nicklaus/models/peminjaman.dart';
import 'database.dart';

///Operation for Peminjaman table
class OperasiPeminjaman {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  ///insert content to table
  createPeminjaman(Peminjaman peminjaman) async {
    final db = await dbRepository.database;
    db.insert('peminjaman', peminjaman.toMap());
  }

  ///get all content
  Future<List<Peminjaman>> getAllPeminjaman() async {
    final db = await dbRepository.database;
    List<Map<String, dynamic>> allRows = await db.query('peminjaman', orderBy: 'FK_anggota_perpustakaan');
    List<Peminjaman> peminjaman =
        allRows.map((peminjaman) => Peminjaman.fromMap(peminjaman)).toList();
    return peminjaman;
  }
}

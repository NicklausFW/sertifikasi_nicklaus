import 'package:sertifikasi_nicklaus/models/anggota.dart';
import 'package:sertifikasi_nicklaus/models/peminjaman.dart';
import 'database.dart';

class OperasiAnggota {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  createAnggota(Anggota anggota) async {
    final db = await dbRepository.database;
    db.insert('anggota', anggota.toMap());
  }

  Future<List<Anggota>> getAllAnggota() async {
    final db = await dbRepository.database;
    List<Map<String, dynamic>> allRows = await db.query('anggota');
    List<Anggota> anggota =
        allRows.map((anggota) => Anggota.fromMap(anggota)).toList();
    return anggota;
  }
}

import 'package:sertifikasi_nicklaus/models/anggota.dart';
import 'database.dart';

///Operation for Anggota table
class OperasiAnggota {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  ///insert content to table
  createAnggota(Anggota anggota) async {
    final db = await dbRepository.database;
    db.insert('anggota', anggota.toMap());
  }

  ///get all content
  Future<List<Anggota>> getAllAnggota() async {
    final db = await dbRepository.database;
    List<Map<String, dynamic>> allRows = await db.query('anggota');
    List<Anggota> anggota =
        allRows.map((anggota) => Anggota.fromMap(anggota)).toList();
    return anggota;
  }
}

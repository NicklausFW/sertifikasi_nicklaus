///model Anggota
class Anggota {
  int? idAnggota;
  String? namaAnggota;

  Anggota({this.idAnggota, this.namaAnggota});

  ///mengubah Map -> [Anggota] Object
  static Anggota fromMap(Map<String, dynamic> map) {
    return Anggota(
      idAnggota: map['idAnggota'],
      namaAnggota: map['namaAnggota'],
    );
  }

  /// Mengubah menjadi Map, karena SQLite menerima Map sebagai input
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'namaAnggota': namaAnggota,
    };
    return map;
  }
}

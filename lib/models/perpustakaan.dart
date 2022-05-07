///model Perpustakaan
class Perpustakaan {
  int? idBuku;
  String? judulBuku;

  Perpustakaan({
    this.idBuku,
    this.judulBuku,
  });

  ///mengubah Map -> [Perpustakaan] Object
  static Perpustakaan fromMap(Map<String, dynamic> map) {
    return Perpustakaan(idBuku: map['idBuku'], judulBuku: map['judulBuku']);
  }

  /// Mengubah menjadi Map, karena SQLite menerima Map sebagai input
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'judulBuku': judulBuku,
    };
    return map;
  }
}

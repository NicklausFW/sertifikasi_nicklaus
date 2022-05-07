///model Peminjaman
class Peminjaman {
  int? id;
  String? namaPeminjam;
  String? tanggalPinjam;
  String? tanggalHarusKembali;
  String? koleksi;

  Peminjaman(
      {this.id,
      this.namaPeminjam,
      this.tanggalPinjam,
      this.tanggalHarusKembali,
      this.koleksi});

  ///mengubah Map -> [Peminjaman] Object
  static Peminjaman fromMap(Map<String, dynamic> map) {
    return Peminjaman(
        id: map['id'],
        namaPeminjam: map['namaPeminjam'],
        tanggalPinjam: map['tanggalPinjam'],
        tanggalHarusKembali: map['tanggalHarusKembali'],
        koleksi: map['koleksi']);
  }

  /// Mengubah menjadi Map, karena SQLite menerima Map sebagai input
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'namaPeminjam': namaPeminjam,
      'tanggalPinjam': tanggalPinjam,
      'tanggalHarusKembali': tanggalHarusKembali,
      'koleksi': koleksi
    };
    return map;
  }
}

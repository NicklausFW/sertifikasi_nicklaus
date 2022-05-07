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

  // convert Map to Contact Object
  static Peminjaman fromMap(Map<String, dynamic> map) {
    return Peminjaman(
        id: map['id'],
        namaPeminjam: map['namaPeminjam'],
        tanggalPinjam: map['tanggalPinjam'],
        tanggalHarusKembali: map['tanggalHarusKembali'],
        koleksi: map['koleksi']);
  }

  //covert to Map, because SQLite take in map as input
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

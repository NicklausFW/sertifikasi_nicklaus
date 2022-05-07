///model Peminjaman
class Peminjaman {
  int? id;
  String? FK_anggota_perpustakaan;
  String? tanggalPinjam;
  String? tanggalHarusKembali;
  String? FK_peminjaman_perpustakaan;

  Peminjaman(
      {this.id,
      this.FK_anggota_perpustakaan,
      this.tanggalPinjam,
      this.tanggalHarusKembali,
      this.FK_peminjaman_perpustakaan});

  ///mengubah Map -> [Peminjaman] Object
  static Peminjaman fromMap(Map<String, dynamic> map) {
    return Peminjaman(
        id: map['id'],
        FK_anggota_perpustakaan: map['FK_anggota_perpustakaan'],
        tanggalPinjam: map['tanggalPinjam'],
        tanggalHarusKembali: map['tanggalHarusKembali'],
        FK_peminjaman_perpustakaan: map['FK_peminjaman_perpustakaan']);
  }

  /// Mengubah menjadi Map, karena SQLite menerima Map sebagai input
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'FK_anggota_perpustakaan': FK_anggota_perpustakaan,
      'tanggalPinjam': tanggalPinjam,
      'tanggalHarusKembali': tanggalHarusKembali,
      'FK_peminjaman_perpustakaan': FK_peminjaman_perpustakaan
    };
    return map;
  }
}

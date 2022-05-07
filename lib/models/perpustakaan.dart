class Perpustakaan {
  int? id;
  String? judulBuku;

  Perpustakaan({
    this.id,
    this.judulBuku,
  });

  // convert Map to Contact Object
  static Perpustakaan fromMap(Map<String, dynamic> map) {
    return Perpustakaan(id: map['id'], judulBuku: map['namaPeminjam']);
  }

  //covert to Map, because SQLite take in map as input
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'judulBuku': judulBuku,
    };
    return map;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/view_model/operasi_peminjaman.dart';
import 'package:sertifikasi_nicklaus/models/peminjaman.dart';

class ListPeminjaman extends StatefulWidget {
  List<Peminjaman> peminjaman;
  ListPeminjaman(this.peminjaman, {Key? key}) : super(key: key);

  @override
  State<ListPeminjaman> createState() => _ListPeminjamanState();
}

class _ListPeminjamanState extends State<ListPeminjaman> {
  OperasiPeminjaman operasiPeminjaman = OperasiPeminjaman();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.peminjaman.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Anggota Yang Pinjam: ${widget.peminjaman[index].FK_anggota_perpustakaan}',
                textWidthBasis: TextWidthBasis.longestLine,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Tanggal Pinjam: ${widget.peminjaman[index].tanggalPinjam}',
                textWidthBasis: TextWidthBasis.longestLine,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Tanggal Harus Kembali: ${widget.peminjaman[index].tanggalHarusKembali}',
                textWidthBasis: TextWidthBasis.longestLine,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Buku Yang Dipinjam: ${widget.peminjaman[index].FK_peminjaman_perpustakaan}',
                textWidthBasis: TextWidthBasis.longestLine,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

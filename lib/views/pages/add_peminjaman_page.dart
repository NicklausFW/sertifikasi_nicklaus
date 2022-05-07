import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sertifikasi_nicklaus/models/anggota.dart';
import 'package:sertifikasi_nicklaus/models/peminjaman.dart';
import 'package:intl/intl.dart';
import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';
import '../../view_model/operasi_anggota.dart';
import '../../view_model/operasi_peminjaman.dart';
import '../../view_model/operasi_perpustakaan.dart';
import '../widgets/dropdown_anggota.dart';
import '../widgets/dropdown_peminjaman.dart';

class AddPeminjamanPage extends StatefulWidget {
  const AddPeminjamanPage({Key? key}) : super(key: key);

  @override
  State<AddPeminjamanPage> createState() => _AddPeminjamanPageState();
}

class _AddPeminjamanPageState extends State<AddPeminjamanPage> {
  OperasiPeminjaman operasiPeminjaman = OperasiPeminjaman();
  OperasiPerpustakaan operasiPerpustakaan = OperasiPerpustakaan();
  OperasiAnggota operasiAnggota = OperasiAnggota();

  Anggota? _selectedAnggota;
  Perpustakaan? _selectedBook;

  callbackSelectedBook(selectedBook) {
    setState(() {
      _selectedBook = selectedBook;
    });
  }

  callbackSelectedAnggota(selectedAnggota) {
    setState(() {
      _selectedAnggota = selectedAnggota;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tambahkan Peminjaman'),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                  future: operasiAnggota.getAllAnggota(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('No Data Yet!');
                    }
                    var data = snapshot.data! as List<Anggota>;
                    return DropdownAnggota(data, callbackSelectedAnggota);
                  },
                ),
                FutureBuilder(
                  future: operasiPerpustakaan.getAllPerpustakaan(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('No Data Yet!');
                    }
                    var data = snapshot.data! as List<Perpustakaan>;
                    return DropdownPeminjaman(data, callbackSelectedBook);
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffD21F3C),
          onPressed: () async {
            if (_selectedAnggota != null && _selectedBook != null) {
              final peminjaman = Peminjaman(
                  FK_anggota_perpustakaan: _selectedAnggota?.namaAnggota,
                  tanggalHarusKembali: DateFormat('yyyy-MM-dd – kk:mm')
                      .format(now.add(Duration(days: 7))) as String,
                  tanggalPinjam:
                      DateFormat('yyyy-MM-dd – kk:mm').format(now) as String,
                  FK_peminjaman_perpustakaan: _selectedBook?.judulBuku);
              operasiPeminjaman.createPeminjaman(peminjaman);
              Navigator.of(context).pushReplacementNamed('/');
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

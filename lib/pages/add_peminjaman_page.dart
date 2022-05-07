import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/data/operasi_peminjaman.dart';
import 'package:sertifikasi_nicklaus/models/peminjaman.dart';
import 'package:intl/intl.dart';

class AddPeminjamanPage extends StatefulWidget {
  const AddPeminjamanPage({Key? key}) : super(key: key);

  @override
  State<AddPeminjamanPage> createState() => _AddPeminjamanPageState();
}

class _AddPeminjamanPageState extends State<AddPeminjamanPage> {
  final _namaPeminjam = TextEditingController();
  OperasiPeminjaman operasiPeminjaman = OperasiPeminjaman();
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    maxLength: 10,
                    controller: _namaPeminjam,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama Peminjam',
                        counterText: ''),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffD21F3C),
          onPressed: () async {
            if (_namaPeminjam.text.isNotEmpty) {
              final peminjaman = Peminjaman(
                  namaPeminjam: _namaPeminjam.text,
                  tanggalHarusKembali: DateFormat('yyyy-MM-dd – kk:mm')
                      .format(now.add(Duration(days: 7))) as String,
                  tanggalPinjam:
                      DateFormat('yyyy-MM-dd – kk:mm').format(now) as String,
                  koleksi: null);
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

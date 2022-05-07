import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/data/operasi_perpustakaan.dart';
import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';

class AddBukuPerpustakaanPage extends StatefulWidget {
  const AddBukuPerpustakaanPage({Key? key}) : super(key: key);

  @override
  State<AddBukuPerpustakaanPage> createState() =>
      _AddBukuPerpustakaanPageState();
}

class _AddBukuPerpustakaanPageState extends State<AddBukuPerpustakaanPage> {
  final _judulBukuController = TextEditingController();
  OperasiPerpustakaan operasiPerpustakaan = OperasiPerpustakaan();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tambahkan buku'),
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
                    controller: _judulBukuController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Judul Buku',
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
            if (_judulBukuController.text.isNotEmpty) {
              final perpustakaan = Perpustakaan(
                judulBuku: _judulBukuController.text,
              );
              operasiPerpustakaan.createPerpustakaan(perpustakaan);
              Navigator.of(context).pushReplacementNamed('/');
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

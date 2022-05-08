import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/view_model/operasi_anggota.dart';
import 'package:sertifikasi_nicklaus/models/anggota.dart';

///page to add anggota
class AddAnggotaPage extends StatefulWidget {
  const AddAnggotaPage({Key? key}) : super(key: key);

  @override
  State<AddAnggotaPage> createState() => _AddAnggotaPageState();
}

class _AddAnggotaPageState extends State<AddAnggotaPage> {
  final _namaAnggotaController = TextEditingController();
  OperasiAnggota operasiAnggota = OperasiAnggota();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tambahkan Anggota'),
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLength: 45,
                controller: _namaAnggotaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Anggota',
                    counterText: ''),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffD21F3C),
          onPressed: () async {
            if (_namaAnggotaController.text.isNotEmpty) {
              final anggota = Anggota(
                namaAnggota: _namaAnggotaController.text,
              );
              operasiAnggota.createAnggota(anggota);
              Navigator.of(context).pushReplacementNamed('/');
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

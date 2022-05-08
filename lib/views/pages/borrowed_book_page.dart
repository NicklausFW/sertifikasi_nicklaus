import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/view_model/operasi_peminjaman.dart';
import 'package:sertifikasi_nicklaus/models/peminjaman.dart';

import '../widgets/list_peminjaman.dart';

///page as a hub to add_peminjaman_page and list_peminjaman
class BorrowedBookPage extends StatefulWidget {
  const BorrowedBookPage({Key? key}) : super(key: key);

  @override
  State<BorrowedBookPage> createState() => _BorrowedBookPageState();
}

class _BorrowedBookPageState extends State<BorrowedBookPage> {
  final OperasiPeminjaman operasiPeminjaman = OperasiPeminjaman();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FutureBuilder(
                  future: operasiPeminjaman.getAllPeminjaman(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('No Data Yet!');
                    }
                    var data = snapshot.data! as List<Peminjaman>;
                    return ListPeminjaman(data);
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/addPeminjamanPage');
        },
        backgroundColor: Color(0xffD21F3C),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

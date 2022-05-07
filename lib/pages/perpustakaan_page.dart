import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/data/operasi_peminjaman.dart';
import 'package:sertifikasi_nicklaus/data/operasi_perpustakaan.dart';
import 'package:sertifikasi_nicklaus/models/anggota.dart';
import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';
import 'package:sertifikasi_nicklaus/pages/anggota_page.dart';

import '../widgets/list_perpustakaan.dart';
import 'borrowed_book_page.dart';

class PerpustakaanPage extends StatefulWidget {
  const PerpustakaanPage({Key? key}) : super(key: key);

  @override
  State<PerpustakaanPage> createState() => _PerpustakaanPageState();
}

class _PerpustakaanPageState extends State<PerpustakaanPage> {
  OperasiPerpustakaan operasiPerpustakaan = OperasiPerpustakaan();
  OperasiPeminjaman operasiPeminjaman = OperasiPeminjaman();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('SQLITE TUTORIAL'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Halaman Perpustakaan',
                icon: Icon(Icons.book),
              ),
              Tab(
                text: 'Halaman Peminjaman',
                icon: Icon(Icons.book_online),
              ),
              Tab(
                text: 'List Anggota',
                icon: Icon(Icons.person),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BookCollectionPage(operasiPerpustakaan: operasiPerpustakaan),
            BorrowedBookPage(),
            AnggotaPage()
          ],
        ),
      ),
    );
  }
}

class BookCollectionPage extends StatelessWidget {
  const BookCollectionPage({
    Key? key,
    required this.operasiPerpustakaan,
  }) : super(key: key);

  final OperasiPerpustakaan operasiPerpustakaan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FutureBuilder(
                  future: operasiPerpustakaan.getAllPerpustakaan(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('No Data Yet!');
                    }
                    var data = snapshot.data! as List<Perpustakaan>;
                    return ListPerpustakaan(data);
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed('/addBukuPerpustakaanPage');
        },
        backgroundColor: Color(0xffD21F3C),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

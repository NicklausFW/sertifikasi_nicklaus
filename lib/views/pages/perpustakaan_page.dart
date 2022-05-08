import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/view_model/operasi_peminjaman.dart';
import 'package:sertifikasi_nicklaus/view_model/operasi_perpustakaan.dart';
import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';
import '../widgets/list_perpustakaan.dart';
import 'anggota_page.dart';
import 'borrowed_book_page.dart';
import 'book_collection_page.dart';

///page as a hub to book_collection_page, anggota_page, and borrowed_book_page
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

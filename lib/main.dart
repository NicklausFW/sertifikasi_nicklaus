import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/pages/add_anggota_page.dart';
import 'package:sertifikasi_nicklaus/pages/add_buku_perpustakaan_page.dart';
import 'package:sertifikasi_nicklaus/pages/add_peminjaman_page.dart';
import 'package:sertifikasi_nicklaus/pages/perpustakaan_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library App',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xffD21F3C))),
      routes: {
        '/': (context) => PerpustakaanPage(),
        '/addBukuPerpustakaanPage': (context) => AddBukuPerpustakaanPage(),
        '/addPeminjamanPage': (context) => AddPeminjamanPage(),
        '/addAnggotaPage': (context) => AddAnggotaPage(),
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/models/anggota.dart';
import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';

class DropdownPeminjaman extends StatefulWidget {
  List<Perpustakaan> perpustakaan;
  Function(Perpustakaan) callbackSelectedBook;

  DropdownPeminjaman(this.perpustakaan, this.callbackSelectedBook, {Key? key})
      : super(key: key);

  @override
  State<DropdownPeminjaman> createState() => _DropdownPeminjamanState();
}

class _DropdownPeminjamanState extends State<DropdownPeminjaman> {
  String? selectedBook;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Perpustakaan>(
      items: widget.perpustakaan.map((buku) {
        return DropdownMenuItem(
          value: buku,
          child: Text(buku.judulBuku!),
        );
      }).toList(),
      hint: selectedBook != null
          ? Text(
              selectedBook!,
              style: TextStyle(color: Colors.black),
            )
          : Text("Empty"),
      onChanged: (Perpustakaan? value) {
        setState(() {
          widget.callbackSelectedBook(value!);
          selectedBook = value.judulBuku;
        });
      },
    );
  }
}

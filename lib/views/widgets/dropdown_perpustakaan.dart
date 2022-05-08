import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/models/perpustakaan.dart';

///dropdown for add_peminjaman_page so the librarian can select the book that the member borrows
class DropdownPerpustakaan extends StatefulWidget {
  List<Perpustakaan> perpustakaan;
  Function(Perpustakaan) callbackSelectedBook;

  DropdownPerpustakaan(this.perpustakaan, this.callbackSelectedBook, {Key? key})
      : super(key: key);

  @override
  State<DropdownPerpustakaan> createState() => _DropdownPerpustakaanState();
}

class _DropdownPerpustakaanState extends State<DropdownPerpustakaan> {
  String? selectedBook;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Perpustakaan>(
      isExpanded: true,
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

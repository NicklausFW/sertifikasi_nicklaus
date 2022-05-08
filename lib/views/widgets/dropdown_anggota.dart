import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/models/anggota.dart';

///dropdown for add_peminjaman_page so the librarian can select the book that the member borrows
class DropdownAnggota extends StatefulWidget {
  List<Anggota> anggota;
  Function(Anggota) callbackSelectedAnggota;

  DropdownAnggota(this.anggota, this.callbackSelectedAnggota, {Key? key})
      : super(key: key);

  @override
  State<DropdownAnggota> createState() => _DropdownAnggotaState();
}

class _DropdownAnggotaState extends State<DropdownAnggota> {
  String? selectedAnggota;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Anggota>(
      isExpanded: true,
      items: widget.anggota.map((anggota) {
        return DropdownMenuItem(
          value: anggota,
          child: Text(anggota.namaAnggota!),
        );
      }).toList(),
      hint: selectedAnggota != null
          ? Text(
              selectedAnggota!,
              style: TextStyle(color: Colors.black),
            )
          : Text("Empty"),
      onChanged: (Anggota? value) {
        setState(() {
          widget.callbackSelectedAnggota(value!);
          selectedAnggota = value.namaAnggota;
        });
      },
    );
  }
}

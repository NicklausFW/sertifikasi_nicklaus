import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sertifikasi_nicklaus/view_model/operasi_perpustakaan.dart';
import '../../models/perpustakaan.dart';

class ListPerpustakaan extends StatefulWidget {
  List<Perpustakaan> perpustakaan;
  ListPerpustakaan(this.perpustakaan, {Key? key}) : super(key: key);

  @override
  State<ListPerpustakaan> createState() => _ListPerpustakaanState();
}

class _ListPerpustakaanState extends State<ListPerpustakaan> {
  OperasiPerpustakaan operasiPerpustakaan = OperasiPerpustakaan();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.perpustakaan.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Judul Buku: ${widget.perpustakaan[index].judulBuku}',
                        textWidthBasis: TextWidthBasis.longestLine,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

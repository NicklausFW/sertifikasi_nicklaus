import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/anggota.dart';
import '../../view_model/operasi_anggota.dart';

class ListAnggota extends StatefulWidget {
  List<Anggota> anggota;

  ListAnggota(this.anggota, {Key? key}) : super(key: key);

  @override
  State<ListAnggota> createState() => _ListAnggotaState();
}

class _ListAnggotaState extends State<ListAnggota> {
  OperasiAnggota operasiAnggota = OperasiAnggota();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.anggota.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Text(
            'Nama Anggota: ${widget.anggota[index].namaAnggota}',
            textWidthBasis: TextWidthBasis.longestLine,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

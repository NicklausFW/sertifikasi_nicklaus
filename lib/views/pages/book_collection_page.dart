import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/perpustakaan.dart';
import '../../view_model/operasi_perpustakaan.dart';
import '../widgets/list_perpustakaan.dart';

///page as a hub to add_buku_perpustakaan_page and list_perpustakaan
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

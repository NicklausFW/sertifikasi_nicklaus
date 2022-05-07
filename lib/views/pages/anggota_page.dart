import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/anggota.dart';
import '../../view_model/operasi_anggota.dart';
import '../widgets/list_anggota.dart';

class AnggotaPage extends StatefulWidget {
  const AnggotaPage({Key? key}) : super(key: key);

  @override
  State<AnggotaPage> createState() => _AnggotaPageState();
}

class _AnggotaPageState extends State<AnggotaPage> {
  final OperasiAnggota operasiAnggota = OperasiAnggota();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FutureBuilder(
                  future: operasiAnggota.getAllAnggota(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('No Data Yet!');
                    }
                    var data = snapshot.data! as List<Anggota>;
                    return ListAnggota(data);
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/addAnggotaPage');
        },
        backgroundColor: Color(0xffD21F3C),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

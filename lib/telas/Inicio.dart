import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/models/Videos.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Videos>> _getData() async {
    Api api = Api();
    var lista = await api.pesquisar("");
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Container(
        child: FutureBuilder<List<Videos>>(
      future: _getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          default:
        }
        List<Videos> listVideo = snapshot.data;
        return ListView.builder(
          itemCount: listVideo.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listVideo[index].id.videoId),
            );
          },
        );
      },
    ));
  }
}

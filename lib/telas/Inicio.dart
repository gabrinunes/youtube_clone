import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/models/Videos.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _getData() async {
    Api api = Api();
    List<Videos> lista = await api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Container(
      child: Center(
        child: Text("Inicio"),
      ),
    );
  }
}

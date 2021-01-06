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
    return FutureBuilder<List<Videos>>(
      future: _getData(),
      builder: (context, snapshot) {
        List<Videos> listVideo = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              listVideo[index].snippet.thumbnails.high.url),
                        )),
                      ),
                      ListTile(
                        title: Text(listVideo[index].snippet.title),
                        subtitle: Text(listVideo[index].snippet.channelTitle),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: listVideo.length,
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
            break;
          default:
        }
      },
    );
  }
}

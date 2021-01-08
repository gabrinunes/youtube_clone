import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/models/Videos.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  String pequisa;

  Inicio(this.pequisa);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<Videos> videosList = [];

  Future<List<Videos>> _getData() async {
    Api api = Api();
    var lista = await api.pesquisar(widget.pequisa);
    final prefs = await SharedPreferences.getInstance();
    Future<bool> videoList = prefs.setString("videos", jsonEncode(lista));
    _getVideoList(videoList);
    return lista;
  }

  _getVideoList(listVideo) async {
    final prefs = await SharedPreferences.getInstance();
    List videos = jsonDecode(prefs.getString("videos"));
    var listVideos = videos.map((data) => Videos.fromJson(data)).toList();
    if (listVideos.isNotEmpty) {
      setState(() {
        videosList = listVideos;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (videosList.isNotEmpty) {
      print("buscando videos:" + videosList[0].id.toString());
    }
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
                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                          apiKey: CHAVE_YOUTUBE_API,
                          videoId: listVideo[index].id.videoId,
                          autoPlay: true,
                          fullScreen: true);
                    },
                    child: Column(
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
                    ),
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

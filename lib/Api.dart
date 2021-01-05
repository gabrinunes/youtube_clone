import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube/models/Videos.dart';

const CHAVE_YOUTUBE_API = "AIzaSyD3xUU__X5T-7LNTAZUHbzV_tWwFZPT95g";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Videos>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      var dadosJson = jsonDecode(response.body);
      List videos = dadosJson["items"];
      var listVideos = videos.map((data) => Videos.fromJson(data)).toList();
      print(listVideos[0].id);
    } else {
      print(response.statusCode);
    }
  }
}

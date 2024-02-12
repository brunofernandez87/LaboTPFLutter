import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TvSerieProvider extends ChangeNotifier {
  late Map<String, dynamic> tvserieData, tvseriesData;
  late List<dynamic> tvseriesLista;
  int numeroAnterior = 0;
  int page = 1;

  Future<void> getTvSerieData() async {
    print(numeroAnterior);
    int random = Random().nextInt(5000);
    print(random);
    if (numeroAnterior == random) {
      print("repetido");
      random = Random().nextInt(5000);
    }
    String id = random.toString();
    String _baseUrl = "https://apoapi.onrender.com/v1/series/tvseries/$id";
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      numeroAnterior = random;
      String body = utf8.decode(response.bodyBytes);
      tvserieData = json.decode(body);
      notifyListeners();
    } else {
      throw Exception("error");
    }
  }

  Future<void> getTvSeriesData() async {
    String _baseUrl = "https://apoapi.onrender.com/v1/series/popularseries/";
    final url = Uri.http('apoapi.onrender.com', '/v1/series/popularseries',
        {'page': page.toString()});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      tvseriesData = json.decode(body);
      tvseriesLista = tvseriesData["results"];
      page++;
      notifyListeners();
    } else {
      throw Exception("error");
    }
  }

  String obtenerURLIMagen() {
    return tvserieData["data"]["poster_path"] ?? "";
  }

  String obtenerNombre() {
    return tvserieData["data"]["name"] ?? "";
  }

  List obtenerListaTvSeries() {
    List tvseries = [];
    for (var i = 0; i < tvseriesLista.length; i++) {
      tvseries.add({
        "name": tvseriesLista[i]["name"],
        "url": tvseriesLista[i]["poster_path"]
      });
    }
    return tvseries;
  }
}

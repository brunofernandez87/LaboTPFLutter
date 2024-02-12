import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeliculaProvider extends ChangeNotifier {
  late Map<String, dynamic> jsonData;
  late List<dynamic> peliculaData;
  int page=1;
  int numeroAnterior = 0;
  late String imagen;
  late String titulo;

  Future<void> getPeliculasData() async {
    int random = Random().nextInt(5000);
    if (numeroAnterior == random) {
      random = Random().nextInt(5000);
      numeroAnterior=random;
    }
    String id = random.toString();
    String _baseUrl = "https://apoapi.onrender.com/v1/lapeli/$id";
    final response = await http.get(Uri.parse(_baseUrl));
    numeroAnterior = random;
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(body);
      imagen=jsonData["data"]["poster_path"];
      titulo=jsonData["data"]["original_title"];
      notifyListeners();
    } else {
      throw Exception("error");
    }
  }
  Future<void> getPeliculaData() async {
    try{
      String _baseUrl = "https://apoapi.onrender.com/v1/pelisdel/";
      final url = Uri.http('apoapi.onrender.com', '/v1/pelisdel/', {
        'page': page.toString(),
        'cfgidioma':"es"
        }
        );
      final response = await http.get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(body);
      page++;
      peliculaData=jsonData["results"];
      notifyListeners();
    } else {
      throw Exception("error");
    }}catch(error){
      print("error al obtener los datos $error");
    }
  }
  

  List listaPeliculas(){
    List peliculas=[];
      for (var i = 0; i < peliculaData.length; i++) {
      peliculas.add({
        "name": peliculaData[i]["title"],
        "url":peliculaData[i]["poster_path"]
      });
    }
    return peliculas;
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PeliculasProvider extends ChangeNotifier {
  late Map<String, dynamic> jsonData;
  late List<dynamic> peliculaData;
  int page=1;

  Future<void> getPeliculaData() async {
    try{
      String _baseUrl = "https://apoapi.onrender.com/v1/pelisdel/";
      final url = Uri.http('apoapi.onrender.com', '/v1/pelisdel/', {'page': page.toString()});
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
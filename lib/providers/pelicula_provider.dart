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
      print("la url es $url");
    if (response.statusCode == 200) {
      print("ingreso correctamente");
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(body);
      notifyListeners();
      page++;
      peliculaData=jsonData["results"];
    } else {
      throw Exception("error");
    }}catch(error){
      print("error al obtener los datos $error");
    }
  }
  List<dynamic>listaPeliculas(){
    print("pelicula data es $peliculaData");
    return peliculaData;
  }

}
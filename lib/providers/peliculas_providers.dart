import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeliculaProvider extends ChangeNotifier {
  late Map<String, dynamic> jsonData;
  int numeroAnterior = 0;

  Future<void> getPeliculasData() async {
    try{
    print("numero anterior $numeroAnterior");
    int random = Random().nextInt(5000);
    print("random es $random");
    if (numeroAnterior == random) {
      random = Random().nextInt(5000);
      numeroAnterior=random;
    }
    String id = random.toString();
    String _baseUrl = "http://localhost:3050/v1/lapeli/$id/";
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      numeroAnterior = random;
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(body);
      notifyListeners();
    } else {
      throw Exception("error");
    }}catch(error){
      print("error al obtener los datos");
    }
  }

  String obtenerURLIMagen() {
    return jsonData["data"]["poster_path"] ?? "";
  }

  String obtenerTitulo() {
    return jsonData["data"]["original_title"] ?? "";
  }
}

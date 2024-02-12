import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeliculaProvider extends ChangeNotifier {
  late Map<String, dynamic> jsonData;
  int numeroAnterior = 0;
  late String imagen;
  late String titulo;

  Future<void> getPeliculasData() async {
    print("numero anterior $numeroAnterior");
    int random = Random().nextInt(5000);
    print("random es $random");
    if (numeroAnterior == random) {
      print("es igual");
      random = Random().nextInt(5000);
      numeroAnterior=random;
    }
    String id = random.toString();
    String _baseUrl = "https://apoapi.onrender.com/v1/lapeli/$id";
    final response = await http.get(Uri.parse(_baseUrl));
    numeroAnterior = random;
    print("numero anterior se cambio a $numeroAnterior");
    if (response.statusCode == 200) {
      print("ingreso correctamente");
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(body);
      imagen=jsonData["data"]["poster_path"];
      titulo=jsonData["data"]["original_title"];
      notifyListeners();
    } else {
      print("salto error");
      throw Exception("error");
    }
  }
}

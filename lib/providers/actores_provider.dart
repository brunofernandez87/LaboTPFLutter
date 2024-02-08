import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorProvider extends ChangeNotifier {
  late Map<String, dynamic> jsonData;
  int numeroAnterior = 0;

  Future<void> getActoresData() async {
    print(numeroAnterior);
    int random = Random().nextInt(5000);
    print(random);
    if (numeroAnterior == random) {
      print("repetido");
      random = Random().nextInt(5000);
    }
    String id = random.toString();
    String _baseUrl = "http://localhost:3050/v1/personas/person/$id";
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      numeroAnterior = random;
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(body);
      notifyListeners();
    } else {
      throw Exception("error");
    }
  }

  String obtenerURLIMagen() {
    return jsonData["data"]["profile_path"] ?? "";
  }

  String obtenerNombre() {
    return jsonData["data"]["name"] ?? "";
  }
}

//String baseImgUrl =
//        "https://image.tmdb.org/t/p${pelicula.obtenerURLIMagen()}";
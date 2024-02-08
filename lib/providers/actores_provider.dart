import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorProvider extends ChangeNotifier {
  final String _baseUrl = "http://localhost:3050/v1/personas/popularpeople";
  late Map<String, dynamic> jsonData;

  Future<void> getActoresData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(body);
      notifyListeners();
    } else {
      throw Exception("error");
    }
  }

  String obtenerURLIMagen() {
    return jsonData["results"]["profile_path"] ?? "";
  }

  String obtenerNombre() {
    return jsonData["data"]["name"] ?? "";
  }
}

//String baseImgUrl =
//        "https://image.tmdb.org/t/p${pelicula.obtenerURLIMagen()}";
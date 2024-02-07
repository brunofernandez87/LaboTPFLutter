import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PeliculaProvider extends ChangeNotifier {
  final String _baseUrl = "https://apoapi.onrender.com/v1/lapeli/2800";
  late Map<String, dynamic> jsonData;

  Future<void> getPeliculasData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      jsonData = json.decode(response.body);
      notifyListeners();
    } else {
      throw Exception("error");
    }
  }
  String obtenerURLIMagen(){
    return jsonData["poster_path"]??"";
  }
}

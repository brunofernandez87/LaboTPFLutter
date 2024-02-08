import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorProvider extends ChangeNotifier {
  late Map<String, dynamic> actorData, actoresData;
  int numeroAnterior = 0;

  Future<void> getActorData() async {
    try {
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
        actorData = json.decode(body);
        notifyListeners();
      } else {
        throw Exception("error");
      }
    } catch (error) {
      print("error al obtener los datos");
    }
  }

  Future<void> getActoresData() async {
    String _baseUrl = "http://localhost:3050/v1/personas/popularpeople";
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      actoresData = json.decode(body);

      notifyListeners();
    } else {
      throw Exception("error");
    }
  }

  String obtenerURLIMagen() {
    return actorData["data"]["profile_path"] ?? "";
  }

  String obtenerNombre() {
    return actorData["data"]["name"] ?? "";
  }

  List obtenerListaActores() {
    List actores = [];
    for (var i = 0; i < actoresData.length; i++) {
      actores.add({
        "name": actoresData["results"]["name"],
        "url": actoresData["results"]["profile_path"]
      });
    }
    return actores;
  }
}

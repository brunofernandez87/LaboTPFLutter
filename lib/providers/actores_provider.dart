import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorProvider extends ChangeNotifier {
  late Map<String, dynamic> actorData, actoresData;
  late List <dynamic> actoresLista;
  int numeroAnterior = 0;
  int page=1;

  Future<void> getActorData() async {
      int random = Random().nextInt(5000);
      if (numeroAnterior == random) {
        random = Random().nextInt(5000);
      }
      String id = random.toString();
      String _baseUrl = "https://apoapi.onrender.com/v1/personas/person/$id";
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        numeroAnterior = random;
        String body = utf8.decode(response.bodyBytes);
        actorData = json.decode(body);
        notifyListeners();
      } else {
        throw Exception("error");
      }
  }

  Future<void> getActoresData() async {
    String _baseUrl = "https://apoapi.onrender.com/v1/personas/popularpeoplefiltro/";
          final url = Uri.http('apoapi.onrender.com', '/v1/personas/popularpeoplefiltro/', {'page': page.toString()});
      final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      actoresData = json.decode(body);
      actoresLista=actoresData["results"];
      page++;
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
    for (var i = 0; i < actoresLista.length; i++) {
      actores.add({
        "name": actoresLista[i]["name"],
        "url":actoresLista[i]["profile_path"]
      });
    }
    return actores;
  }
}

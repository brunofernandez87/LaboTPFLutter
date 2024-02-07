import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorProvider extends ChangeNotifier {
  final String _baseUrl = "http://localhost:3050/v1/personas/popularpeople";
  List<dynamic> actoresData = [];

  Future<void> getActoresData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = json.decode(body);

      for (var element in jsonData["results"]) {
        actoresData
            .add({"nombre": element["name"], "url": element["profile_path"]});
      }

      notifyListeners();
    } else {
      throw Exception("error");
    }
  }
}

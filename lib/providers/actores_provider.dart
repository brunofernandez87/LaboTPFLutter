import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorProvider extends ChangeNotifier {
  final String _apiKey = "81773fc17b6d26ff3e93b6d9a7c2efd3";
  final String _baseUrl = "http://localhost:3050/v1/personas/popularpeople";

  Future<void> getActoresData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = json.decode(response.body);
      notifyListeners();
    } else {
      throw Exception("error");
    }
  }
}

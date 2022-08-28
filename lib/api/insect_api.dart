import "dart:convert";

import "package:http/http.dart" as http;

import '../config/insect_api.dart';
import "../models/insect.dart";

Future<Insect> fetchInsect(int id) async {
  final response = await http.get(Uri.parse('$insectEndpoint/$id'));
  if (response.statusCode == 200) {
    return Insect.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load insect');
  }
}

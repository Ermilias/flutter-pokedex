import 'dart:convert';
import 'package:flutter_app/models/pokemon.dart';
import 'package:http/http.dart' as http;

final String apiUrl = "https://gist.githubusercontent.com/scitbiz/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json";

Future<List<Pokemon>> fetchPokemons() async {
  final result = await http.get(apiUrl);
  final data = (json.decode(result.body) as List)
      .map((item) => Pokemon.fromJson(item))
      .toList();
  return data;
}
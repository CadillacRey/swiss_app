import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swiss_streaming/constants.dart';
import 'package:swiss_streaming/models/movie.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=es-ES?api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse(_trendingUrl),
      headers: {
        'Authorization': 'Bearer ${Constants.apiKey}',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Fallo la llamada a la API: ${response.statusCode}');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(
      Uri.parse(_topRatedUrl),
      headers: {
        'Authorization': 'Bearer ${Constants.apiKey}',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Fallo la llamada a la API: ${response.statusCode}');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse(_upcomingUrl),
      headers: {
        'Authorization': 'Bearer ${Constants.apiKey}',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Fallo la llamada a la API: ${response.statusCode}');
    }
  }
}

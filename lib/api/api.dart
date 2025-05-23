import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swiss_streaming/constants.dart';
import 'package:swiss_streaming/models/movie.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=es-ES?api_key=${Constants.apiKey}'; // ya no necesita api_key en la URL

  //static const _topRatedUrl =
  //   'https://api.themoviedb.org/3/top_rated/movie/day?language=es-ES?api_key=${Constants.apiKey}'; // ya no necesita api_key en la URL

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
      //print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Fallo la llamada a la API: ${response.statusCode}');
    }
  }
}

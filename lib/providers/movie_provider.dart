import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MovieProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  final String _language = 'es-MX';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  MovieProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<void> getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  Future<void> getPopularMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    final popularResponse = PopularResponse.fromRawJson(response.body);

    popularMovies = popularResponse.results;

    notifyListeners();
  }

  Future<List<Cast>> getMoviesCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) {
      return moviesCast[movieId]!;
    }

    var url = Uri.https(_baseUrl, '/3/movie/$movieId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final response = await http.get(url);

    final creditsResponse = CreditsResponse.fromJson(jsonDecode(response.body));

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}

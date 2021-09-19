import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pelis/models/movie.dart';
import 'package:pelis/models/now_playing_response.dart';
import 'package:pelis/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apikey = '92f5fb7291380dcff63ba5a523e4452d';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  int _popularPage = 0;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    this.getOnDisplayMovies();
    this.getPupularMovies();
  }
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apikey, 'language': _languaje, 'page': '$page'});
    var response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    // final Map<String, dynamic> decodeData = json.decode(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPupularMovies() async {
    _popularPage++;
    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    // final Map<String, dynamic> decodeData = json.decode(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}

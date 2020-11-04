import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:movies/Movie.dart';

class HttpHelper {
  
  String urlDomain    = 'https://api.themoviedb.org/3/movie';
  String apiKey       = 'api_key=89db676e08b3729fa899366e9ee46f2f';
  String urlLanguage  = '&language=en-US';
  String urlPage      = '&page=1';

  Future<List<Movie>> getPopularMovies() async {
    String typeOfQuery = 'popular?';
    String uri = urlDomain + typeOfQuery + apiKey + urlLanguage + urlPage;

    http.Response resp = await http.get(uri);

    // validate response
    if(resp.statusCode == HttpStatus.ok) {
      final decodedJsonMap = json.decode(resp.body);

      Movies movieList = new Movies.fromjsonList(decodedJsonMap['results']);
      return movieList.movies;
    } else {
      return null;
    }
  }
}
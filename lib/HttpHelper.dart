import 'package:http/http.dart' as http;
import 'dart:io';

class HttpHelper {
  final String uri = 'https://api.themoviedb.org/3/movie/550?api_key=89db676e08b3729fa899366e9ee46f2f';

  Future<String> getMovieList() async {
    http.Response response = await http.get(uri);
    if(response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      return null;
    }
  }
}
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';
import '../../utils/constants.dart';
import 'movie_strings.dart';

class MovieApiProvider {
  http.Client client = http.Client();

  Future<Movie> fetchAllMovies() async {
    final _response = await client.get(
      Uri.parse(
        MovieStrings.uriClient,
      ),
    );
    return response(_response);
  }

  Future<Movie> searchByMovieName(String nameMovie) async {
    final _response = await client.get(
      Uri.parse(
        MovieStrings.uriSearchClient + nameMovie,
      ),
    );
    return response(_response);
  }

  Movie response(http.Response _response) {
    if (_response.statusCode == Constants.status) {
      return Movie.fromJson(json.decode(
        _response.body,
      ));
    } else {
      throw Exception(
        MovieStrings.error + _response.statusCode.toString(),
      );
    }
  }
}

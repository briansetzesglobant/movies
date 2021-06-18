import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';
import '../../utils/constants.dart';
import 'movie_strings.dart';

class MovieApiProvider {
  http.Client client = http.Client();

  Future<MovieModel> fetchAllMovies() async {
    final _response = await client.get(
      Uri.parse(
        MovieStrings.uriClient,
      ),
    );
    return resp(_response);
  }

  Future<MovieModel> searchByMovieName(String nameMovie) async {
    final _response = await client.get(
      Uri.parse(
        MovieStrings.uriSearchClient + nameMovie,
      ),
    );
    return resp(_response);
  }

  MovieModel resp(http.Response _response) {
    if (_response.statusCode == Constants.status) {
      return MovieModel.fromJson(json.decode(
        _response.body,
      ));
    } else {
      throw Exception(
        MovieStrings.error + _response.statusCode.toString(),
      );
    }
  }
}

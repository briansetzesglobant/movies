import 'dart:async';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import 'dart:convert';
import '../models/movie_model.dart';

class MoviesApiProvider {
  http.Client client = http.Client();

  Future<MovieModel> fetchMoviesList() async {
    final _response = await client.get(
      Uri.parse(
        Constants.uriClient,
      ),
    );
    if (_response.statusCode == Constants.status) {
      return MovieModel.fromJson(json.decode(
        _response.body,
      ));
    } else {
      throw Exception(
        Constants.error,
      );
    }
  }
}

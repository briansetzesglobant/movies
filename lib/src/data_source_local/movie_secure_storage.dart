import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movies/src/data_source_local/data_base_interface.dart';
import '../models/movie.dart';
import '../models/movie_result.dart';

class MovieSecureStorage implements DataBaseInterface {
  MovieSecureStorage._privateConstructor();

  static final MovieSecureStorage instance =
      MovieSecureStorage._privateConstructor();

  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<void> writeMovieDataBase(Movie result) async {
    _storage.deleteAll();
    result.results.forEach((element) async {
      await _storage.write(
          key: element.id.toString(), value: json.encode(element.toJson()));
    });
  }

  @override
  Future<List<MovieResult>> readMovieDataBase() async {
    Map<String, String> allValues = await _storage.readAll();
    return allValues.keys
        .map((key) => MovieResult.fromJson(json.decode(allValues[key]!)))
        .toList();
  }
}

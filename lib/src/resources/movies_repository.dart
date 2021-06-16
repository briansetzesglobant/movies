import 'dart:async';
import 'movies_api_provider.dart';
import '../models/movie_model.dart';

class MoviesRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<MovieModel> fetchAllMovies() => moviesApiProvider.fetchMoviesList();
}

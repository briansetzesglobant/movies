import 'dart:async';
import 'movies_api_provider.dart';
import '../models/item_model.dart';

class MoviesRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMoviesList();
}

import 'dart:async';
import 'package:movies/src/resources/i_movie_repository.dart';
import 'movie_api_provider.dart';
import '../models/movie.dart';

class MovieRepository extends IMovieRepository {
  final moviesApiProvider = MovieApiProvider();

  @override
  Future<MovieModel> fetchAllMovies() => moviesApiProvider.fetchAllMovies();

  @override
  Future<MovieModel> searchByMovieName(String nameMovie) =>
      moviesApiProvider.searchByMovieName(
        nameMovie,
      );
}

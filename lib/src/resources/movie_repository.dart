import 'dart:async';
import '../data_source_local/movie_secure_storage.dart';
import '../data_source_local/movie_sqlite.dart';
import 'i_movie_repository.dart';
import 'movie_api_provider.dart';
import '../models/movie.dart';

class MovieRepository extends IMovieRepository {
  final moviesApiProvider = MovieApiProvider();
  final MovieSecureStorage movieSecureStorage = MovieSecureStorage.instance;
  final MovieSQLite movieSQLite = MovieSQLite.instance;

  @override
  Future<Movie> fetchAllMovies() async {
    final result = await moviesApiProvider.fetchAllMovies();
    await movieSecureStorage.writeMovieDataBase(result);
    await movieSQLite.writeMovieDataBase(result);
    return result;
  }

  @override
  Future<Movie> searchByMovieName(String nameMovie) =>
      moviesApiProvider.searchByMovieName(
        nameMovie,
      );
}

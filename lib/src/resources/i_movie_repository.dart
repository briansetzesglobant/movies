import '../models/movie.dart';

abstract class IMovieRepository {
  Future<MovieModel> fetchAllMovies();

  Future<MovieModel> searchByMovieName(String nameMovie);
}

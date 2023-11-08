import '../models/movie.dart';
import '../models/movie_result.dart';

abstract class DataBaseInterface {
  void writeMovieDataBase(Movie result);

  Future<List<MovieResult>> readMovieDataBase();
}

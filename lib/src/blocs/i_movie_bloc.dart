import '../models/movie.dart';
import 'bloc.dart';

abstract class IMovieBloc extends Bloc {
  Stream<Movie> get moviesStream;

  void fetchAllMovies();

  void searchByMovieName(String nameMovie);
}

import '../models/movie_model.dart';
import 'bloc.dart';

abstract class IMoviesBloc extends Bloc {
  Stream<MovieModel> get moviesStream;

  void fetchAllMovies();
}

import 'dart:async';
import '../models/movie_model.dart';
import '../resources/movies_repository.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  MoviesRepository _moviesRepository = MoviesRepository();
  StreamController<MovieModel> _moviesStreamController = StreamController();

  @override
  void initialize() {}

  @override
  void dispose() {
    _moviesStreamController.close();
  }

  @override
  Stream<MovieModel> get moviesStream => _moviesStreamController.stream;

  @override
  void fetchAllMovies() async {
    final _moviesList = await _moviesRepository.fetchAllMovies();
    _moviesStreamController.sink.add(_moviesList);
  }

  @override
  void searchByMovieName(String nameMovie) async {
    if (nameMovie.isEmpty) {
      fetchAllMovies();
    } else {
      _moviesStreamController.sink
          .add(await _moviesRepository.searchByMovieName(nameMovie));
    }
  }
}

import 'dart:async';
import '../models/movie.dart';
import '../resources/movie_repository.dart';
import 'i_movie_bloc.dart';

class MovieBloc extends IMovieBloc {
  MovieRepository _moviesRepository = MovieRepository();
  StreamController<Movie> _moviesStreamController = StreamController();

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {
    _moviesStreamController.close();
  }

  @override
  Stream<Movie> get moviesStream => _moviesStreamController.stream;

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

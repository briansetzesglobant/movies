import 'dart:async';
import '../models/item_model.dart';
import '../resources/movies_repository.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  MoviesRepository moviesRepository = MoviesRepository();
  StreamController<ItemModel> moviesStreamController = StreamController();

  @override
  void initialize() {}

  @override
  void dispose() {
    this.moviesStreamController.close();
  }

  @override
  Stream<ItemModel> get moviesStream => this.moviesStreamController.stream;

  @override
  void fetchAllMovies() async {
    final _moviesList = await moviesRepository.fetchAllMovies();
    this.moviesStreamController.sink.add(_moviesList,);
  }
}

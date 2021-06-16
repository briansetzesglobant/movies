import '../models/item_model.dart';
import 'bloc.dart';

abstract class IMoviesBloc extends Bloc {
  Stream<ItemModel> get moviesStream;

  void fetchAllMovies();
}

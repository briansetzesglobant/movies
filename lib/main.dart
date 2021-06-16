import 'package:flutter/material.dart';
import 'src/blocs/movies_bloc.dart';
import 'src/ui/movies_list.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final MoviesBloc _moviesBloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoviesList(
          title: "Movies App",
          bloc: _moviesBloc,
        ),
     );
  }
}

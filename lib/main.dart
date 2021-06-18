import 'package:flutter/material.dart';
import 'src/blocs/movie_bloc.dart';
import 'src/ui/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final MovieBloc _moviesBloc = MovieBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: "Movies App",
        bloc: _moviesBloc,
      ),
    );
  }
}

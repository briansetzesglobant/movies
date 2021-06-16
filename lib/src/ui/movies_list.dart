import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../blocs/i_movies_bloc.dart';
import '../models/item_model.dart';

class MoviesList extends StatefulWidget {
  final String title;

  final IMoviesBloc bloc;

  MoviesList({
    Key key,
    this.title,
    this.bloc,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MoviesListState();
  }
}

class MoviesListState extends State<MoviesList> {
  @override
  void initState() {
    super.initState();
    widget.bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: widget.bloc.moviesStream,
        builder: (
          context,
          AsyncSnapshot<ItemModel> snapshot,
        ) {
          if (snapshot.hasData) {
            return buildList(
              snapshot,
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Constants.crossAxisCountNumber,
        ),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return GridTile(
            child: Container(
              padding: EdgeInsets.all(
                Constants.paddingNumber,
              ),
              child: Image.network(
                Constants.imageNetwork +
                    snapshot.data.results[index].poster_path,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}

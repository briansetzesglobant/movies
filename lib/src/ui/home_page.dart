import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles.dart';
import '../blocs/i_movie_bloc.dart';
import '../models/movie.dart';
import 'popular_movies_grid.dart';

class HomePage extends StatefulWidget {
  final String title;

  final IMovieBloc bloc;

  HomePage({
    required this.title,
    required this.bloc,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          Constants.preferredSizeFromHeight,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  Constants.childrenPadding,
                ),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyles.styleTitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  Constants.childrenPadding,
                ),
                child: SizedBox(
                  child: TextField(
                    style: TextStyles.styleSearch,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                          right: Constants.paddingIcon,
                        ),
                        child: Icon(
                          Icons.east,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onSubmitted: (nameMovie) {
                      widget.bloc.searchByMovieName(nameMovie);
                    },
                  ),
                  width: Constants.searchSizedBoxWidth,
                  height: Constants.searchSizedBoxHeight,
                ),
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: widget.bloc.moviesStream,
        builder: (
          context,
          AsyncSnapshot<Movie> snapshot,
        ) {
          return snapshot.hasData
              ? PopularMoviesGrid(
                  movieData: snapshot.data!,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

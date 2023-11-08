import 'package:flutter/material.dart';
import 'package:movies/src/ui/data_base_page.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles.dart';
import '../blocs/i_movie_bloc.dart';
import '../data_source_local/movie_secure_storage.dart';
import '../data_source_local/movie_sqlite.dart';
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
  final MovieSecureStorage movieSecureStorage = MovieSecureStorage.instance;
  final MovieSQLite movieSQLite = MovieSQLite.instance;

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
                padding: EdgeInsets.only(
                  top: 30.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (
                                context,
                              ) =>
                                  DataBasePage(dataBase: movieSecureStorage),
                            ),
                          );
                        },
                        child: const Text(
                          'Secure Storage',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (
                                context,
                              ) =>
                                  DataBasePage(dataBase: movieSQLite),
                            ),
                          );
                        },
                        child: const Text(
                          'SQLite',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

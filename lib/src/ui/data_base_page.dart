import 'package:flutter/material.dart';
import 'package:movies/src/data_source_local/data_base_interface.dart';
import 'package:widgets/widgets.dart';
import '../../utils/constants.dart';
import '../models/movie_result.dart';
import '../resources/movie_strings.dart';

class DataBasePage extends StatefulWidget {
  const DataBasePage({
    Key? key,
    required this.dataBase,
  }) : super(key: key);

  final DataBaseInterface dataBase;

  @override
  State<DataBasePage> createState() => _DataBasePageState();
}

class _DataBasePageState extends State<DataBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: widget.dataBase.readMovieDataBase(),
        builder: (
          context,
          AsyncSnapshot<List<MovieResult>> snapshot,
        ) {
          return snapshot.hasData
              ? GridView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Constants.crossAxisCountNumber,
                  ),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (
                              context,
                            ) =>
                                MovieDetailPage(
                              movieReleaseDate:
                                  snapshot.data![index].releaseDate!.isNotEmpty
                                      ? snapshot.data![index].releaseDate!
                                      : MovieStrings.movieDefaultDate,
                              movieOverview: snapshot.data![index].overview,
                              moviePosterPath: snapshot.data![index].posterPath,
                              movieTitle: snapshot.data![index].title,
                              movieVoteAverage:
                                  snapshot.data![index].voteAverage.toString(),
                            ),
                          ),
                        );
                      },
                      child: MovieDetailImage(
                        posterPath: snapshot.data![index].posterPath,
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

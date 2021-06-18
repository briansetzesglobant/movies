import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles.dart';
import '../blocs/i_movies_bloc.dart';
import '../models/movie_model.dart';

class HomePage extends StatefulWidget {
  final String title;

  final IMoviesBloc bloc;

  HomePage({
    Key key,
    this.title,
    this.bloc,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
                  width: Constants.widthSearch,
                  height: Constants.heightSearch,
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
          AsyncSnapshot<MovieModel> snapshot,
        ) {
          return snapshot.hasData
              ? buildList(
                  snapshot,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot) {
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
              snapshot.data.results[index].poster_path,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

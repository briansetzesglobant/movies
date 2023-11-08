import 'package:movies/src/data_source_local/data_base_interface.dart';
import 'package:sqflite/sqflite.dart';
import '../models/movie.dart';
import '../models/movie_result.dart';

class MovieSQLite implements DataBaseInterface {
  MovieSQLite._privateConstructor();

  static final MovieSQLite instance = MovieSQLite._privateConstructor();

  Future<Database> _openMovieSQLite() async {
    return await openDatabase('movies.db',
        onCreate: (Database db, int version) async {
      return await db.execute(
        '''CREATE TABLE movie (
              id INTEGER PRIMARY KEY,
              vote_count INTEGER,
              video INTEGER,
              vote_average REAL NOT NULL,
              title TEXT NOT NULL,
              popularity REAL,
              poster_path TEXT NOT NULL,
              original_language TEXT,
              original_title TEXT,
              genre_ids TEXT,
              backdrop_path TEXT,
              adult INTEGER,
              overview TEXT NOT NULL,
              release_date TEXT
        )''',
      );
    }, version: 1);
  }

  @override
  Future<void> writeMovieDataBase(Movie result) async {
    Database database = await _openMovieSQLite();
    await database.delete('movie');
    result.results.forEach((element) async {
      await database.insert('movie', element.toJson(db: true));
    });
  }

  @override
  Future<List<MovieResult>> readMovieDataBase() async {
    Database database = await _openMovieSQLite();
    List<Map<String, dynamic>> allValues = await database.query('movie');
    await database.close();
    return allValues
        .map((element) => MovieResult.fromJson(element, db: true))
        .toList();
  }
}

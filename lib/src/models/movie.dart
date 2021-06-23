import 'movie_result.dart';

class Movie {
  int _page;
  int _total_results;
  int _total_pages;
  List<MovieResult> _results = [];

  Movie.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    _total_results = json['total_results'];
    _total_pages = json['total_pages'];
    List<MovieResult> temp = [];
    for (int i = 0; i < json['results'].length; i++) {
      MovieResult result = MovieResult(json['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<MovieResult> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

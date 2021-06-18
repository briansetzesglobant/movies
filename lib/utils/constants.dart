abstract class Constants {
  static const int crossAxisCountNumber = 2;
  static const double paddingNumber = 10.0;
  static const String imageNetwork = "https://image.tmdb.org/t/p/w185";

  static const double preferredSizeFromHeight = 100.0;
  static const double childrenPadding = 5;
  static const double paddingIcon = 20.0;
  static const double widthSearch = 250.0;
  static const double heightSearch = 30.0;
  static const double textStyleFontSize = 25.0;
  static const double textStyleLetterSpacing = 2.0;
  static const double textStyleFontSizeSmall = 25.0;

  static const String uri = "https://api.themoviedb.org/3/";
  static const String apiKey = "385737c6d715026a1cd89526ff9d8d44";
  static const String uriClient = uri + "movie/popular?api_key=" + apiKey;
  static const String uriSearchClient =
      uri + "search/movie?api_key=" + apiKey + "&query=";
  static const int status = 200;
  static const String error = 'An error has occurred while loading movies';
}

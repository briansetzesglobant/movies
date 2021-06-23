abstract class MovieStrings {
  static const String imageNetwork = "https://image.tmdb.org/t/p/w185";

  static const String uri = "https://api.themoviedb.org/3/";
  static const String apiKey = "385737c6d715026a1cd89526ff9d8d44";
  static const String uriClient = uri + "movie/popular?api_key=" + apiKey;
  static const String uriSearchClient =
      uri + "search/movie?api_key=" + apiKey + "&query=";

  static const String error = 'An error has occurred while loading movies';

  static const String imageDefault =
      "https://kubalubra.is/wp-content/uploads/2017/11/default-thumbnail.jpg";
}

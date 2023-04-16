class Constants {
  static String baseUrl = "https://api.themoviedb.org/3/movie/";
  static String apiKey = "909594533c98883408adef5d56143539";

  static String popularMovieUrl = "popular";

  static String latestMovieUrl = "latest";

  static String topRated = "top_rated";

  static String imgBasePath =
      "https://api.themoviedb.org/3/movie/?api_key=$apiKey";

  static String imgPath(String extensionPath) => "$imgBasePath$extensionPath";
}

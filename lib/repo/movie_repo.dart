import 'package:movieapp/utils/api_util.dart';
import 'package:movieapp/utils/constants.dart';

class MovieRepo {
  final ApiUtil _apiUtil = ApiUtil.instance;

  Future getPopularMovies({int pageNo = 1}) {
    return _apiUtil.get(
      path: Constants.popularMovieUrl,
      queryParameters: {"page": pageNo},
    );
  }

  Future getTopRatedMovies({int pageNo = 1}) {
    return _apiUtil.get(
      path: Constants.topRated,
      queryParameters: {"page": pageNo},
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movieapp/repo/movie_repo.dart';

enum MovieType { popular, topRated }

class MovieListPvd with LoadOnScroll, ChangeNotifier, LoadingUtil {
  late MovieType type;
  final MovieRepo _repo = MovieRepo();
  int _pageNo = 1;

  List? movieList = [];

  MovieListPvd(this.type) {
    init();
  }

  init() async {
    isLoading = true;
    try {
      if (type == MovieType.topRated) {
        movieList = (await _repo.getTopRatedMovies(pageNo: _pageNo))['results'];
      } else if (type == MovieType.popular) {
        movieList = (await _repo.getPopularMovies(pageNo: _pageNo))['results'];
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @override
  Future loadOnScroll() async {
    List response = [];
    _pageNo++;
    try {
      if (type == MovieType.topRated) {
        response = await _repo.getTopRatedMovies(pageNo: _pageNo);
      } else if (type == MovieType.popular) {
        response = await _repo.getPopularMovies(pageNo: _pageNo);
      }

      if (response.isNotEmpty) {
        movieList?.add(response);
      } else {
        removeScrollListener();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  bool get hasData => movieList != null && (movieList?.isNotEmpty ?? false);
}

///
///
////
mixin LoadOnScroll {
  //if lock is true then we will not listen to scroll movement
  bool _lock = false;
  int loadOffset = 300;
  ScrollController controller = ScrollController();

  void addScrollListener() {
    controller.addListener(_loadOnScroll);
  }

  void removeScrollListener() {
    controller.removeListener(_loadOnScroll);
  }

  void _loadOnScroll() {
    if (!_lock &&
        controller.offset > controller.position.minScrollExtent - loadOffset) {
      _lock = true;

      loadOnScroll().whenComplete(() => _lock = false);
    }
  }

  Future loadOnScroll();
}
//

//
//
//
mixin LoadingUtil on ChangeNotifier {
  bool get hasData;

  bool _isLoading = false;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
}

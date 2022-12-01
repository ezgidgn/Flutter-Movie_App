import 'package:get/get.dart';
import 'package:movie_project/model/movie_list_model.dart';
import 'package:movie_project/model/movie_model.dart';
import 'package:movie_project/services/service.dart';

class MovieController extends GetxController {
  MovieService movieService = MovieService();
  var isLoading = false.obs;
  var isFound = true.obs;

  MovieListModel? recommendedList = MovieListModel();
  MovieListModel? topList = MovieListModel();
  MovieListModel? movieSearchList = MovieListModel();
  MovieModel? movieModel = MovieModel();
  List splittedActors = [];

  Future<void> fetchMovieList(String top,String recommended) async {
    isLoading.value = true;
    topList = await movieService.fetchMovieList(top);
    recommendedList = await movieService.fetchMovieList(recommended);
    isLoading.value = false;
  }


  Future<void> fetchSearchMovieList(String search) async {
    await Future.delayed(Duration(seconds: 1));
    movieSearchList = MovieListModel();
    movieSearchList = await movieService.fetchMovieList(search);
    movieSearchList?.search != null
        ? isFound.value = true
        : isFound.value = false;
  }

  Future<void> fetchMovie(String imdb) async {
    movieModel = await movieService.fetchMovie(imdb);

    splittedActors = movieModel!.actors!.split(",");
    for (var i = 0; i < splittedActors.length; i++) {
      if (splittedActors[i] is String) {
        if (splittedActors[i].startsWith(" ")) {
          String element = splittedActors[i];
          splittedActors[i] = element.replaceFirst(RegExp(r' '), '');
          splittedActors[i] = splittedActors[i].replaceAll(RegExp(r' '), '\n');
        }
      }
    }
    splittedActors[0] = splittedActors[0].replaceAll(RegExp(r' '), '\n');
  }
}
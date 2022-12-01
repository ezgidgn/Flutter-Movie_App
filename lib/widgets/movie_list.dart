import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/model/movie_list_model.dart';
import 'package:movie_project/screen/movie_view.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key, required MovieListModel model, required double widht})
      : _model = model,
        _widht = widht,
        super(key: key);
  double _widht;
  MovieListModel _model;

  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movieController.recommendedList?.search?.length ?? 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (() async {
            await movieController
                .fetchMovie(_model.search?[index].imdbID ?? "tt1201607");
            Get.to(MovieView(),preventDuplicates: false);
          }),
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            _model.search?[index].poster ??
                                "https://picsum.photos/200/300",
                            width: MediaQuery.of(context).size.width * _widht,
                            fit: BoxFit.cover,
                          ))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

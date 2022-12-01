import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/model/movie_list_model.dart';
import 'package:movie_project/widgets/movie_list.dart';
import '../mixin/color_mixin.dart';


class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView>with ColorMixin  {
  

  MovieController movieController = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40, right: 15, left: 15, bottom: 15),
        child: Column(
          children: [
            Expanded(flex: 25, child: Row(children: [
    Expanded(
        child: Stack(
          children: <Widget> [Image.network(
            movieController.movieModel?.poster ??
              'https://picsum.photos/200/300',
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.keyboard_arrow_left_outlined))
            ]
        )),
    Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.33,
        child: _movieDetail(movieController: movieController, thistle: thistle),
      ),
    )),
  ])),
  Expanded(
          flex: 2,
            child: Text(
          'Actors',
          style: Theme.of(context).textTheme.headline6,
        )),
            Expanded(flex: 4, child: _actorsName(movieController: movieController)),
            Spacer(),
            Obx(() => movieController.isLoading.value
                ? SizedBox.shrink()
                : Expanded(
                    flex: 30,
                    child: _otherMovies(movieController: movieController),
                  )),
          ],
        ),
      ),
    );
  }

}

class _otherMovies extends StatelessWidget {
  const _otherMovies({
    Key? key,
    required this.movieController,
  }) : super(key: key);

  final MovieController movieController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: Text(
              "TRENDING NOW",
              style: Theme.of(context).textTheme.subtitle1,
            )),
        Spacer(),
        Expanded(
          flex: 28,
          child: MovieList(
              widht: 0.3,
              model: movieController.recommendedList ?? MovieListModel()),
        ),
        Spacer(
          flex: 3,
        ),
        Expanded(
            flex: 4,
            child: Text(
              "TOP MOVIES",
              style: Theme.of(context).textTheme.subtitle1,
            )),
        Spacer(),
        Expanded(
          flex: 28,
          child: MovieList(
              widht: 0.3, model: movieController.topList ?? MovieListModel()),
        ),
      ],
    );
  }
}

class _actorsName extends StatelessWidget {
  const _actorsName({
    Key? key,
    required this.movieController,
  }) : super(key: key);

  final MovieController movieController;

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Expanded(
          flex:2,
          child: Row(
    children: [
      Expanded(
          child: Text(
            movieController.splittedActors[1] ??
        '',
        style: Theme.of(context).textTheme.subtitle1,
        maxLines: 2,
        textAlign: TextAlign.center,
      )),
      Expanded(
          child: Text(
            movieController.splittedActors[2] ??
        '',
        style: Theme.of(context).textTheme.subtitle1,
        maxLines: 2,
        textAlign: TextAlign.center,
      )),
      Expanded(
          child: Text(
            movieController.splittedActors[0] ??
        '',
        style: Theme.of(context).textTheme.subtitle1,
        maxLines: 2,
        textAlign: TextAlign.center,
      )),
    ],
          ),
        ),
      ],
    ),
  );
  }
}

class _movieDetail extends StatelessWidget {
  const _movieDetail({
    Key? key,
    required this.movieController,
    required this.thistle,
  }) : super(key: key);

  final MovieController movieController;
  final Color thistle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: Text(
              movieController.movieModel?.title ??
              'Title',
              style: Theme.of(context).textTheme.headline5,
            )),
        Expanded(
            flex: 2,
            child: Text(movieController.movieModel?.imdbRating ??
              'IMDB',
                style: Theme.of(context).textTheme.subtitle1)),
        Expanded(
            flex: 1,
            child: Text(movieController.movieModel?.genre  ??
              'Action, Fantactic, Harror',
                style: Theme.of(context).textTheme.subtitle2)),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Expanded(
              child: Text(
            'Plot Summary',
            style: Theme.of(context).textTheme.subtitle1,
          )),
        ),
        Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                child: ListView(children: [
                  Text(movieController.movieModel?.plot  ??
                      'plot',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(color:thistle)),
                ]),
              ),
            )),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                  child: Text(movieController.movieModel?.year  ??
                    'Year',
                      style: Theme.of(context).textTheme.subtitle2)),
              
              Expanded(
                child: Text(movieController.movieModel?.runtime  ??
                  "2h32min",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

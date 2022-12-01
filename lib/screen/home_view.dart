import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/mixin/color_mixin.dart';
import 'package:movie_project/model/movie_list_model.dart';
import 'package:movie_project/screen/movie_view.dart';
import 'package:movie_project/screen/search.dart';
import 'package:movie_project/widgets/movie_list.dart';
import 'package:lottie/lottie.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ColorMixin {
  @override
  void initState() {
    super.initState();
    _movieController.fetchMovieList('Harry Potter', 'Blade Runner');
  }

  MovieController _movieController = Get.put(MovieController());
  TextEditingController _textEditingController = TextEditingController();
  final loadingLottie = Lottie.asset("assets/lottie/loading.json");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                  child: Text('Welcome',
                      style: Theme.of(context).textTheme.headline5)),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "What would you like to watch today?",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            await _movieController.fetchSearchMovieList(_textEditingController.text);
                            Get.to(SearchPage());
                          }, icon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Obx(() => _movieController.isLoading.value
                //TODO:
                ? loadingLottie
                : Expanded(
                    flex: 30,
                    child: _showMovie(context),
                  )),
          ],
        ),
      ),
    );
  }

  Column _showMovie(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 30,
          child: MovieList(
              widht: 0.8,
              model: _movieController.recommendedList ?? MovieListModel()),
        ),
        Spacer(
          flex: 3,
        ),
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
              model: _movieController.recommendedList ?? MovieListModel()),
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
              widht: 0.3, model: _movieController.topList ?? MovieListModel()),
        ),
      ],
    );
  }
}

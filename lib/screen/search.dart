import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/mixin/color_mixin.dart';
import 'package:movie_project/screen/home_view.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_project/screen/movie_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with ColorMixin {
  @override
  void initState() {
    super.initState();
  }

  MovieController movieController = Get.put(MovieController());
  final movieName = 'Lucy';
  final exampleImage = 'https://picsum.photos/200/300';
  final searchResult = 'SEARCH RESULT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: russianViolet,
        appBar: AppBar(
          title: Text(searchResult),
        ),
        body: Column(
          children: [
            Expanded(
              child: movieController.isFound.value
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                          movieController.movieSearchList?.search?.length ?? 10,
                          (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              height: 130,
                              child: InkWell(
                                onTap: () async {
                                  await movieController.fetchMovie(
                                      movieController.movieSearchList
                                              ?.search?[index].imdbID ??
                                          'imdbıd');
                                  Get.to(MovieView());
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: darkCharcoal,
                                  child: Column(children: [
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            child: Image.network(
                                              movieController.movieSearchList
                                                      ?.search?[index].poster ??
                                                  exampleImage,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                                flex: 4,
                                                child: Text(
                                                  movieController
                                                          .movieSearchList
                                                          ?.search?[index]
                                                          .title ??
                                                      movieName,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              )),
                        );
                      }),
                    )
                  : Lottie.asset("assets/lottie/search.json"),
            ),
          ],
        ));
  }
}

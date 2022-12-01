import 'package:movie_project/widgets/movie_list.dart';
import 'package:vexana/vexana.dart';
import '../model/movie_list_model.dart';
import '../model/movie_model.dart';

class MovieService {
  late INetworkManager networkManager;
  String baseUrl = "http://www.omdbapi.com/?apikey=852159f0&";

  void init() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: baseUrl));
  }

  Future<MovieModel?> fetchMovie(String imdb) async {
    init();
        final response = await networkManager.send<MovieModel,MovieModel>("i=$imdb",
        parseModel: MovieModel(), method: RequestType.GET);
    return response.data;
  }

  Future<MovieListModel?> fetchMovieList(String search) async {
    init();
    final response = await networkManager.send<MovieListModel,MovieListModel>("s=$search",
        parseModel: MovieListModel(), method: RequestType.GET);
    return response.data;
  }
}
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_list_model.g.dart';

@JsonSerializable()
class MovieListModel extends INetworkModel{
  List<Search>? search;

  MovieListModel({this.search});

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
  return _$MovieListModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
  return _$MovieListModelToJson(this);
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return _$MovieListModelFromJson(json);
  }
}
@JsonSerializable()
class Search {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  Search({this.title, this.year, this.imdbID, this.type, this.poster});

  factory Search.fromJson(Map<String, dynamic> json) {
  return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchToJson(this);
  }
}

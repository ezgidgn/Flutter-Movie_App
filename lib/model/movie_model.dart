import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends INetworkModel {
  String? title;
  String? year;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? actors;
  String? plot;
  String? poster;
  String? imdbRating;

  MovieModel(
      {this.title,
      this.year,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.actors,
      this.plot,
      this.poster,
      this.imdbRating});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieModelToJson(this);
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }
}

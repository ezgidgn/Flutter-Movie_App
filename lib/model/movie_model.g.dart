// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      released: json['Released'] as String?,
      runtime: json['Runtime'] as String?,
      genre: json['Genre'] as String?,
      director: json['Director'] as String?,
      actors: json['Actors'] as String?,
      plot: json['Plot'] as String?,
      poster: json['Poster'] as String?,
      imdbRating: json['imdbRating'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Poster': instance.poster,
      'imdbRating': instance.imdbRating,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) =>
    MovieListModel(
      search: (json['Search'] as List<dynamic>?)
          ?.map((e) => Search.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieListModelToJson(MovieListModel instance) =>
    <String, dynamic>{
      'Search': instance.search,
    };

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      imdbID: json['imdbID'] as String?,
      type: json['Type'] as String?,
      poster: json['Poster'] as String?,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Type': instance.type,
      'Poster': instance.poster,
    };

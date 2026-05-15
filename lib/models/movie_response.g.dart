// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    _MovieResponse(
      results:
          (json['results'] as List<dynamic>)
              .map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MovieResponseToJson(_MovieResponse instance) =>
    <String, dynamic>{'results': instance.results};

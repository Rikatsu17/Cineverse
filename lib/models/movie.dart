import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,

    @JsonKey(name: 'poster_path')
    required String posterPath,

    @JsonKey(name: 'vote_average')
    required double voteAverage,

    required String overview,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);
}
// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieApiService extends MovieApiService {
  _$MovieApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieApiService;

  @override
  Future<Response<dynamic>> getTrendingMovies(String apiKey) {
    final Uri $url = Uri.parse('/trending/movie/week');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

import 'package:chopper/chopper.dart';

part 'movie_api_service.chopper.dart';

@ChopperApi()
abstract class MovieApiService
    extends ChopperService {

  @GET(path: '/trending/movie/week')
  Future<Response<dynamic>>
  getTrendingMovies(
      @Query('api_key') String apiKey,
      );

  @GET(path: '/search/movie')
  Future<Response<dynamic>> searchMovies(
      @Query('api_key') String apiKey,

      @Query('query') String query,
      );

  static MovieApiService create(
  [ChopperClient? client]
  ) =>
  _$MovieApiService(client);
}
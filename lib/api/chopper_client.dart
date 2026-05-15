import 'package:chopper/chopper.dart';

import '../constants.dart';
import 'movie_api_service.dart';

final chopperClient = ChopperClient(
  baseUrl: Uri.parse(tmdbBaseUrl),

  services: [
    MovieApiService.create(),
  ],

  converter: const JsonConverter(),
);

final movieApiService =
chopperClient.getService<MovieApiService>();
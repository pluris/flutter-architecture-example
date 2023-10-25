import 'package:dio/dio.dart';
import 'package:flutter_architecture_example/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/character')
  Future<HttpResponse<String>> getCharacters(
    @Query("page") int page,
  );
}

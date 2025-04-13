import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning_application/core/resources/data_state.dart';
import 'package:learning_application/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:learning_application/features/daily_news/data/models/article.dart';
import 'package:learning_application/features/daily_news/domain/entities/article.dart';
import 'package:learning_application/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: dotenv.env["NEWS_API_KEY"],
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

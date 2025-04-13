import 'package:learning_application/core/resources/data_state.dart';
import 'package:learning_application/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}

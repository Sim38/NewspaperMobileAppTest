import 'package:learning_application/features/daily_news/data/models/article.dart';

class ArticleResponseModel {
  final String? status;
  final int? totalResults;
  final List<ArticleModel> articles;

  const ArticleResponseModel({
    this.status,
    this.totalResults,
    required this.articles,
  });

  factory ArticleResponseModel.fromJson(Map<String, dynamic> map) {
    return ArticleResponseModel(
      status: map["status"] ?? "",
      totalResults: map["totalResults"] ?? 0,
      articles: convertJsonToArticle(map["articles"]),
    );
  }

  static List<ArticleModel> convertJsonToArticle(List<dynamic> articles) {
    return articles.map((article) => ArticleModel.fromJson(article)).toList();
  }
}

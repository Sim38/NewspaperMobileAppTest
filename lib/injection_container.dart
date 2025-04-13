import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_application/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:learning_application/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:learning_application/features/daily_news/domain/repository/article_repository.dart';
import 'package:learning_application/features/daily_news/domain/usecases/get_article.dart';
import 'package:learning_application/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  // News Api Service
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}

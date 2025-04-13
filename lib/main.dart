import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning_application/config/theme/app_themes.dart';
import 'package:learning_application/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:learning_application/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:learning_application/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:learning_application/injection_container.dart';

void main() async {
  await dotenv.load();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: DailyNews(),
      ),
    );
  }
}

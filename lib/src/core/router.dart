import 'package:flutter/material.dart';
 import 'package:news_apps_flutter/src/blocs/comment_bloc_provider.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc_provider.dart';
import 'package:news_apps_flutter/src/core/route_paths.dart';
import 'package:news_apps_flutter/src/screens/news_detail_screen.dart';
import 'package:news_apps_flutter/src/screens/news_screen.dart';

class Router {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NEWS_LIST:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              final bloc = NewsBlocProvider.of(context);
              bloc.fetchTopIds();

              return NewsScreen();
            },
          );
        }
      case NEWS_DETAIL:{
          int newsId = routeSettings.arguments as int;
          return MaterialPageRoute(
            builder: (BuildContext context) {
              final bloc = CommentBlocProvider.of(context);
              bloc.commentFetcher(newsId);
               

              return NewsDetail(newsId);
            },
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: Text('This route is not defined'),
                ),
              );
            },
          );
        }
    }
  }
}

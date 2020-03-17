import 'package:flutter/material.dart';
import 'package:news_apps_flutter/src/blocs/comment_bloc_provider.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc_provider.dart';
import 'package:news_apps_flutter/src/core/route_paths.dart';
import 'package:news_apps_flutter/src/core/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsBlocProvider(
      child: CommentBlocProvider(
        child: MaterialApp(
          title: 'Hacker news app',
          onGenerateRoute: Router.generateRoute,
          initialRoute: NEWS_LIST,
        ),
      ),
    );
  }
}

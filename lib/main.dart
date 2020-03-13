import 'package:flutter/material.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc_provider.dart';
import 'package:news_apps_flutter/src/screens/news_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker news app',
      home: NewsBlocProvider(
        child: NewsScreen(),
      ),
    );
  }
}

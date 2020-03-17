import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final int newsId;
  NewsDetail(this.newsId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: Center(
        child: Text("We show news detail here $newsId"),
      ),
    );
  }
}

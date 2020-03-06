import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest News"),
      ),
      body: _buildNewsList(context),
    );
  }

  Widget _buildNewsList(BuildContext context) {
    return Center(
      child: Text("we show list of news here"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc_provider.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc.dart';
import 'package:news_apps_flutter/src/widgets/news_item.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = NewsBlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest News"),
      ),
      body: _buildNewsList(context, bloc),
    );
  }

  Widget _buildNewsList(BuildContext context, NewsBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: () async{
           await bloc.clearData();
           await bloc.fetchTopIds();
          },
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              bloc.itemId(snapshot.data[index]);
              return NewsItem(id: snapshot.data[index]);
            },
          ),
        );
      },
    );
  }
}

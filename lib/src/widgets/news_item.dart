import 'package:flutter/material.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc_provider.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';

class NewsItem extends StatelessWidget {
  final int id;
  NewsItem({this.id});
  @override
  Widget build(BuildContext context) {
    final NewsBloc bloc = NewsBlocProvider.of(context);
    return StreamBuilder(
      stream: bloc.itemStream,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Text("Still loading data $id");
        }
        return FutureBuilder(
          future: snapshot.data[id],
          builder: (context, AsyncSnapshot<ItemModel> sn) {
            if (!sn.hasData) {
              return Text("Still loading data from future $id");
            }
            return Text(sn.data.title);
          },
        );
      },
    );
  }
}

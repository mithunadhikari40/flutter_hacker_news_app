 
import 'package:flutter/material.dart';
import 'package:news_apps_flutter/src/blocs/comment_bloc.dart';
import 'package:news_apps_flutter/src/blocs/comment_bloc_provider.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';
import 'package:news_apps_flutter/src/widgets/comment.dart';
import 'package:news_apps_flutter/src/widgets/loading_container.dart';

class NewsDetail extends StatelessWidget {
  final int newsId;
  NewsDetail(this.newsId);
  @override
  Widget build(BuildContext context) {
    final bloc = CommentBlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: buildCommentsBody(bloc),
    );
  }

  Widget buildCommentsBody(CommentBloc bloc) {
    return StreamBuilder(
      stream: bloc.commentOutput,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return FutureBuilder(
          future: snapshot.data[newsId],
          builder: (BuildContext context, AsyncSnapshot<ItemModel> sn) {
            if (!sn.hasData) {
              return LoadingContainer();
            }
            return buildCommentList(sn.data, snapshot.data);
          },
        );
      },
    );
  }

  Widget buildCommentList(ItemModel item, Map<int, Future<ItemModel>> data) {
  
    return ListView(
      children: <Widget>[
        buildTitle(item),
        ...item.kids
            ?.map((int kidId) => Comment(commentId: kidId, map: data,depth: 1,))
            ?.toList()
        //we recrusively show the comment list
      ],
    );
  }

  Widget buildTitle(ItemModel data) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(16),
      child: Text(
        data.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}

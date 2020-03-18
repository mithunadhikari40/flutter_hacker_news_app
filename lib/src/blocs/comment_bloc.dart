import 'package:news_apps_flutter/src/db/repository.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';
import 'package:rxdart/rxdart.dart';

class CommentBloc {
  final _repository = Repository();
  PublishSubject<int> _commentFetcher = PublishSubject<int>();
  BehaviorSubject<Map<int, Future<ItemModel>>> _commentOutput =
      BehaviorSubject<Map<int, Future<ItemModel>>>();

  //getters for sink
  Function(int) get commentFetcher => _commentFetcher.sink.add;

  /// getters for stream
  Stream<Map<int, Future<ItemModel>>> get commentOutput =>
      _commentOutput.stream;

  CommentBloc() {
    _commentFetcher.stream.transform(_commentTransform()).pipe(_commentOutput);
  }

  _commentTransform() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
        (Map<int, Future<ItemModel>> cache, int id, int index) {
         print("Index $index and id $id");
      cache[id] = _repository.fetchItem(id);

      cache[id].then((ItemModel item) {
         item.kids?.forEach((kidId) {
          commentFetcher(kidId);
        });
      });

      //recursive data fetching and loading
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  dispose() {
    _commentOutput.close();
    _commentFetcher.close();
  }
}

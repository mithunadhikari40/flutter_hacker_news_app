import 'dart:async';

import 'package:news_apps_flutter/src/db/repository.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = Repository();
  BehaviorSubject<List<int>> _topIds = BehaviorSubject<List<int>>();

  BehaviorSubject<int> _itemId = BehaviorSubject<int>();
  //getter for sink
  Function(int) get itemId => _itemId.sink.add;

  Stream<List<int>> get topIds => _topIds.stream;

  Stream<Map<int, Future<ItemModel>>> itemStream;
 
  NewsBloc() {
    itemStream = _itemId.stream.transform(_itemTransform());
  }

  fetchTopIds() async {
    final list = await _repository.fetchTopIds();
    _topIds.sink.add(list);
  }

  _itemTransform() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, index) {
        print("It is called $index times");
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _itemId.close();
    // _itemStream.close();
  }
}

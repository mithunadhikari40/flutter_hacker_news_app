import 'package:news_apps_flutter/src/db/repository.dart';
import 'package:rxdart/rxdart.dart';
import ''
class NewsBlock {
  final _repository = Repository();
  BehaviorSubject<int> _topIds = BehaviorSubject<int>();

  fetchTopIds() async {
    final list = await _repository.fetchTopIds();
    _topIds.sink.add(list);
  }

  Stream<List<int>> get topIds => _topIds.stream;

  dispose() {
    _topIds.close();
  }
}

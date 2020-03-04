import 'package:news_apps_flutter/src/models/items_model.dart';

abstract class Sources {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem();
  Future<int> insertItem(ItemModel item);
}

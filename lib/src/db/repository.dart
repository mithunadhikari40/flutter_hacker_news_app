import 'package:news_apps_flutter/src/db/api_provider.dart';
import 'package:news_apps_flutter/src/db/db_provider.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';

class Repository {
  final dbProvider = DbProvider();
  final apiProvider = ApiProvider();
  fetchTopIds() async {
    return await apiProvider.fetchTopIds();
  }

  fetchItem(int id) async {
    // check if the id is saved in localdb
    // if yes, retreive
    // if no, get from api and save the row  in localdb for future use
    ItemModel item;
    item = await dbProvider.fetchItem(id);
    if (item == null) {
      item = await apiProvider.fetchItem(id);
      if (item != null) {
        dbProvider.insertItem(item);
      }
    }
    return item;
  }
}

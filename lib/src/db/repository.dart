import 'package:news_apps_flutter/src/db/api_provider.dart';
import 'package:news_apps_flutter/src/db/db_provider.dart';
import 'package:news_apps_flutter/src/db/sources.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';

class Repository {
  List<Sources> sources = [DbProvider(), ApiProvider()];

  /*
  final dbProvider = DbProvider();
  final apiProvider = ApiProvider();
  */

  fetchTopIds() async {
    return await sources[1].fetchTopIds();
  }

  fetchItem(int id) async {
    // check if the id is saved in localdb
    // if yes, retreive
    // if no, get from api and save the row  in localdb for future use

    // ItemModel item;
    // item = await dbProvider.fetchItem(id);
    // if (item == null) {
    //   item = await apiProvider.fetchItem(id);
    //   if (item != null) {
    //     dbProvider.insertItem(item);
    //   }
    // }
    // return item;
    int row = 0;
    var source;
    ItemModel item;
    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
      row = row + 1;
    }
    if (item != null && row > 0) {
      source.insertItem(item);
    }

    for (var origin in sources) {
      if (source != origin) {
        origin.insertItem(item);
      }
    }

    return item;
  }
}

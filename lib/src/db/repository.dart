import 'package:news_apps_flutter/src/db/api_provider.dart';
import 'package:news_apps_flutter/src/db/db_provider.dart';
import 'package:news_apps_flutter/src/db/sources.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';

class Repository {
  List<Sources> sources = [dbProvider, ApiProvider()];
  List<Cache> caches = [dbProvider];

  Future<List<int>> fetchTopIds() async {
    return await sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    Sources source;
    ItemModel item;
    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var origin in caches) {
      if (source != origin as Sources) {
        origin.insertItem(item);
      }
    }
    return item;
  }

  clearData() async {
    for (var c in caches) {
      c.clearData();
    }
  }
}

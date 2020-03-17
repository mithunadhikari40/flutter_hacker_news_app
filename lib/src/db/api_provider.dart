import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_apps_flutter/src/core/constants.dart';
import 'package:news_apps_flutter/src/db/sources.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';

class ApiProvider implements Sources {
  Client client = Client();
  @override
  Future<List<int>> fetchTopIds() async {
    final response = await client.get("$BASE_URL/topstories.json");
    return jsonDecode(response.body).cast<int>();  
  }


  @override
  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$BASE_URL/item/$id.json");
    return ItemModel.fromJson(jsonDecode(response.body));
  }
}

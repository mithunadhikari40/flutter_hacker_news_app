import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_apps_flutter/src/core/constants.dart';
import 'package:news_apps_flutter/src/models/items_model.dart';

class ApiProvider {
  Client client = Client();
  fetchTopIds() async {
    final response = await client.get("$BASE_URL/topstories.json");
    return jsonDecode(response.body); // return ids;
  }

  fetchItem(int id) async {
    final response = await client.get("$BASE_URL/item/$id.json");
    return ItemModel.fromJson(jsonDecode(response.body));
  }
}

import 'package:http/http.dart' show Client;
import 'dart:convert' show json;

import '../models/item_model.dart';
import 'repository.dart' show Source;

class NewsApiProvider implements Source {
  Client client = Client();
  final String _ROOT_URL = 'https://hacker-news.firebaseio.com/v0';

  Future<List<int>> fetchTopIds() async {
    final res = await client.get('$_ROOT_URL/topstories.json?print=pretty');
    final ids = json.decode(res.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final res = await client.get('$_ROOT_URL/item/$id.json');
    final parsedJson = json.decode(res.body);

    return ItemModel.fromJson(parsedJson);
  }
}

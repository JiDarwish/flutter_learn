import 'package:http/http.dart' show Client;
import 'dart:convert' show json;

import '../models/item_model.dart';

class NewsApiProvider {
  Client _client = Client();
  final _ROOT_URL = 'https://hacker-news.firebaseio.com/v0';

  fetchTopIds() async {
    final res = await _client.get('$_ROOT_URL/topstories.json?print=pretty');
    final ids = json.decode(res.body);

    return ids;
  }

  fetchItem(int id) async {
    final res = await _client.get('$_ROOT_URL/item/$id.json');
    final parsedJson = json.decode(res.body);

    return ItemModel.fromJson(parsedJson);
  }
}

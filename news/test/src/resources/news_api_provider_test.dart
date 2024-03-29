import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:news/src/models/item_model.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:http/testing.dart' show MockClient;

void main() {
  test('Fetch top stories', () async {
    MockClient client = MockClient((req) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    NewsApiProvider newsApiProvider = NewsApiProvider();
    newsApiProvider.client = client;

    final ids = await newsApiProvider.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('Fetch item returns an ItemModel', () async {
    final jsonExample = {
      "by": "tel",
      "descendants": 16,
      "id": 121003,
      "kids": [121016, 121109, 121168],
      "score": 25,
      "text":
          "<i>or</i> HN: the Next Iteration<p>I get the impression that with Arc being released a lot of people who never had time for HN before are suddenly dropping in more often. (PG: what are the numbers on this? I'm envisioning a spike.)<p>Not to say that isn't great, but I'm wary of Diggification. Between links comparing programming to sex and a flurry of gratuitous, ostentatious  adjectives in the headlines it's a bit concerning.<p>80% of the stuff that makes the front page is still pretty awesome, but what's in place to keep the signal/noise ratio high? Does the HN model still work as the community scales? What's in store for (++ HN)?",
      "time": 1203647620,
      "title": "Ask HN: The Arc Effect",
      "type": "story"
    };

    final newsApi = NewsApiProvider();
    final mockClient = MockClient((req) async {
      return await Response(
        json.encode(jsonExample),
        200,
      );
    });

    newsApi.client = mockClient;

    ItemModel item = await newsApi.fetchItem(999);
    expect(item.id, 121003);
  });
}

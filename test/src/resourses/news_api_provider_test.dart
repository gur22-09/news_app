import 'package:news/src/resourses/news_api_provider.dart';

import 'dart:convert';
import 'package:test_api/test_api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds return a list of IDs', () async {
    // setup of test case
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();
    //expectation

    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem returns an ItemModel instance', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id' : 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItems(999);
    expect(item.id, 123);
  });
}

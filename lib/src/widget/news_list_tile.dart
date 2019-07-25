import 'package:flutter/material.dart';
import '../models/item_models.dart';
import '../blocs/stories_provider.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (_, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Text("Stream still loading");
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (_, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text("Still loading $itemId");
            }
            return Text('${itemSnapshot.data.title}');
          },
        );
      },
    );
  }
}

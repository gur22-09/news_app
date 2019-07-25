import 'package:flutter/material.dart';
import 'package:news/src/widget/news_list_tile.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {

    bloc.fetchTopIds();
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (_, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (_, index) {
            bloc.fetchItem(snapshot.data[index]);
            return NewsListTile(itemId: snapshot.data[index],);
          },
        );
      },
    );
  }
}

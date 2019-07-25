import 'package:flutter/material.dart';
import 'package:news/src/Screens/news_detail.dart';
import 'package:news/src/blocs/comments_provider.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'blocs/stories_provider.dart';
import 'blocs/comments_bloc.dart';
import 'Screens/newsList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News',
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(

        builder: (context) {
          return NewsList();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          final commentsBloc = CommentsProvider.of(context);
          final itemId = int.parse(settings.name.replaceFirst('/', ''));
          commentsBloc.fetchItemsWithComments(itemId);
          return NewsDetail(
            itemId: itemId
          );
        }
      );
    }
  }
}

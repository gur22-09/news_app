import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'blocs/stories_provider.dart';
import 'Screens/newsList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        home: NewsList(),
      ),
    );
  }
}

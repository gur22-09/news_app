import 'package:flutter/material.dart';

import 'Screens/newsList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      home: NewsList(),
    );
  }
}

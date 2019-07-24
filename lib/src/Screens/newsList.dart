import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
        ),
        body: Text("show a list"));
  }
}

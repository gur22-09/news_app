import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
        ),
        body: buildList());
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (_, index) {
        return FutureBuilder(
          future: getFuture(),
          builder: (_, snapshot) {
            return Container(
              height: 80,
              child: snapshot.hasData
                  ? Text('I am visible $index')
                  : Text('No data fetched yet $index'),
            );
          },
        );
      },
    );
  }

  getFuture() {
    return Future.delayed(Duration(seconds: 4), () => 'hi');
  }
}

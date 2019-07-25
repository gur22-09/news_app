import 'stories_bloc.dart';
export 'stories_bloc.dart';
import 'package:flutter/material.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Widget child})
      : bloc = StoriesBloc(),
        super(child: child);

  bool updateShouldNotify(_) => true;

  static StoriesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StoriesProvider)
            as StoriesProvider)
        .bloc;
  }
}

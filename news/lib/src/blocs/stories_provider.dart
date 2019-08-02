import 'package:flutter/material.dart';
import './stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final bloc;

  StoriesProvider({Key key, Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  static StoriesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(StoriesProvider)
              as StoriesProvider)
          .bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

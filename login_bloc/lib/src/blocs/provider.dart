import 'package:flutter/material.dart';

import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  // Not automatically passed to super!!!
  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
}

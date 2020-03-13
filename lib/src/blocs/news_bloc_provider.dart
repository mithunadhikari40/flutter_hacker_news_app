import 'package:flutter/cupertino.dart';
import 'package:news_apps_flutter/src/blocs/news_bloc.dart';

class NewsBlocProvider extends InheritedWidget {
  final _bloc = NewsBloc();

  static NewsBloc of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<NewsBlocProvider>()
        ._bloc);
  }

  NewsBlocProvider({Key key, Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

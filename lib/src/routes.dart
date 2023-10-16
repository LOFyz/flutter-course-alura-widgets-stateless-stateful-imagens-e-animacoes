// create a routes object and export
import 'package:flutter/material.dart';
import 'package:primeiro_projeto_do_curso/src/components/templates/home.dart';

class Routes {
  static const String home = '/';
  static const String test = '/test';

  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => const Home(),
    };
  }
}

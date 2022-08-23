import 'package:flutter/material.dart';

import 'package:pizzeria_flutter/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'order': (BuildContext context) => const Order(),
    'home': (BuildContext context) => const Home(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const Home(),
    );
  }
}

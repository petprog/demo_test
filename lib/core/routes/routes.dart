import 'package:flutter/material.dart';

import '../../features/auth/login/view/login.dart';
import '../../features/home/view/home.dart';

class Routes {
  static const homeRoute = "home";
  static const loginRoute = "/";
}

Route onGenerateRoutes(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case Routes.homeRoute:
      page = const Home();
      break;

    case Routes.loginRoute:
      page = const Login();
      break;
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

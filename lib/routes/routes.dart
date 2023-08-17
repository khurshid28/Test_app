import 'package:flutter/material.dart';
import 'package:test_app/routes/route_names.dart';

import '../ui/views/home/mainView.dart';
import '../ui/views/pageNotView.dart';
import '../ui/views/registrationView.dart';

class Routes {
  static Route? ongenerateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    dynamic args = settings.arguments;

    switch (routeName) {
      case RouteNames.RegistrationView:
        return customPageRoute(RegistrationView());
      case RouteNames.HomeView:
        return customPageRoute(HomeView());


      default:
        return customPageRoute(PageNotFound());
    }
  }

  static customPageRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}

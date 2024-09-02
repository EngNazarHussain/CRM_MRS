import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:crm_mrs_app/view/screens/login/login.dart';
import 'package:crm_mrs_app/view/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String TrackComplaints = "/TrackComplaints";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => Splash());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LogIn());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => BottomNavBar());
      // case Routes.TrackComplaints:
      //   return MaterialPageRoute(builder: (_) => TrackTasks());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text("No Route Found")),
              body: Center(child: Text("No Route Found")),
            ));
  }
}

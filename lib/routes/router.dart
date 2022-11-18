
import 'package:api_task/ui/home_page.dart';
import 'package:api_task/utils/constants.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
    return null;
  }
}

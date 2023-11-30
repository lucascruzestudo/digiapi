import 'package:digiapi/src/modules/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String main = '/';
  static const String details = '/details';

  static final Map<String, WidgetBuilder> routes = {
    main: (context) => const MainPage(),
    // details: (context) => const DetailsPage(),
  };
}
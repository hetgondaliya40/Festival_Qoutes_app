import 'package:flutter/cupertino.dart';

import '../screens/detalispage/details.dart';
import '../screens/homepage/home.dart';
import '../screens/quotepage/qoutes.dart';
import '../screens/splashscreen/spalsh.dart';

class Routes {
  static String splashscreen = "/";
  static String homepage = "home_page";
  static String detailspage = "details_page";
  static String quotepage = "quote_page";

  static Map<String, WidgetBuilder> myRoutes = {
    splashscreen: (context) => const Spalshscreen(),
    homepage: (context) => const HomePage(),
    detailspage: (context) => const DetailsPage(),
    quotepage: (context) => const QoutesPage(),
  };
}

import 'package:core_flutter_exam/views/detailPage/detailPage.dart';
import 'package:core_flutter_exam/views/homePage/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String homePage = '/';
  static String detailPage = "detail_page";

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => HomePage(),
    detailPage: (context) => Detailpage(),
  };
}

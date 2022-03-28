import 'package:cat_facts_app/views/history.dart';
import 'package:cat_facts_app/views/home.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static const home = Routes.home;
  static final routes = [
  GetPage(
  name: Routes.history,
  page: () => History(),
  )
  ];
}
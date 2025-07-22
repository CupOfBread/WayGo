import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/login/login_view.dart';
import 'package:waygo/pages/my/my_index/my_index_view.dart';
import 'package:waygo/pages/my/about/about_page.dart';

import '../pages/home/home_view.dart';
import '../pages/root/root_binding.dart';
import '../pages/root/root_view.dart';
import '../pages/spot/spot_detail_page.dart';

class AppRoute {
  static const String root = '/root';
  static const String login = '/login';
  static const String home = '/home';
  static const String my = '/my';
  static const String about = '/about';
  static const String spotDetail = '/spotDetail';

  static final routes = [
    GetPage(name: root, page: () => RootPage(), binding: RootBinding()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: my, page: () => MyIndexPage()),
    GetPage(name: about, page: () => AboutPage()),
    GetPage(name: spotDetail, page: () => const SpotDetailPage()),
  ];
}

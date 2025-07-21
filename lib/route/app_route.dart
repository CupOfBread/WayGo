import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/login/login_view.dart';
import 'package:waygo/pages/my/my_index/my_index_view.dart';

import '../pages/home/home_view.dart';
import '../pages/root/root_binding.dart';
import '../pages/root/root_view.dart';

class AppRoute {
  static const String root = '/root';
  static const String login = '/login';
  static const String home = '/home';
  static const String my = '/my';

  static final routes = [
    GetPage(name: root, page: () => RootPage(), binding: RootBinding()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: my, page: () => MyIndexPage()),
  ];
}

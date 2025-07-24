import 'package:get/get.dart';
import 'package:waygo/pages/login/login_view.dart';
import 'package:waygo/pages/my/my_index/my_index_view.dart';
import 'package:waygo/pages/my/about/about_view.dart';
import 'package:waygo/pages/my/my_profile/my_profile_view.dart';
import 'package:waygo/pages/my/my_footprint/my_footprint_view.dart';
import 'package:waygo/pages/my/stamp_collection/stamp_collection_view.dart';
import 'package:waygo/pages/my/ticket_album/ticket_album_view.dart';
import 'package:waygo/pages/radio/radio_view.dart';

import 'package:waygo/pages/home/home_view.dart';
import 'package:waygo/pages/root/root_view.dart';

import '../pages/scenic_spot/scenic_spot_detail_view.dart';

class AppRoute {
  static const String root = '/root';
  static const String login = '/login';
  static const String home = '/home';
  static const String my = '/my';
  static const String about = '/my/about';
  static const String spotDetail = '/scenic_spot/detail';
  static const String radio = '/radio';
  static const String profile = '/my/profile';
  static const String myFootprint = '/my/footprint';
  static const String stampCollection = '/my/stamp_collection';
  static const String ticketAlbum = '/my/ticket_album';

  static final routes = [
    GetPage(name: root, page: () => RootPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: my, page: () => MyIndexPage()),
    GetPage(name: about, page: () => AboutPage()),
    GetPage(name: spotDetail, page: () => const ScenicSpotDetailPage()),
    GetPage(name: radio, page: () => const RadioPage()),
    GetPage(name: profile, page: () => const MyProfilePage()),
    GetPage(name: myFootprint, page: () => const MyFootprintPage()),
    GetPage(name: stampCollection, page: () => const StampCollectionPage()),
    GetPage(name: ticketAlbum, page: () => TicketAlbumPage()),
  ];
}

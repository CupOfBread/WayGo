import 'package:get/get.dart';

import '../../component/bottom_nav_bar/bottom_nav_bar_logic.dart';
import 'root_logic.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootLogic());
    Get.lazyPut(() => BottomNavBarLogic());
  }
} 
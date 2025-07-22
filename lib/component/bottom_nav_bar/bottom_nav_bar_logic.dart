import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'bottom_nav_bar_state.dart';

class BottomNavBarLogic extends GetxController {
  final BottomNavBarState state = BottomNavBarState();

  void changeNavIndex(int index) {
    state.currentIndex.value = index;
    HapticFeedback.lightImpact();
  }
}

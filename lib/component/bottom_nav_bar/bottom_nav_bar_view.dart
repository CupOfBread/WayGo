import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_nav_bar_logic.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarComponent extends StatelessWidget {
  BottomNavBarComponent({super.key});

  final BottomNavBarLogic logic = Get.find<BottomNavBarLogic>();
  final BottomNavBarState state = Get.find<BottomNavBarLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: state.currentIndex.value,
        iconSize: 28,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedFontSize: 10,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.98),
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          logic.changeNavIndex(index);
        },
        items: state.bottomNavItemList
            .map((item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.name))
            .toList(),
      );
    });
  }
}

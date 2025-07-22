import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BottomNavBarState {
  final currentIndex = 0.obs;
  Color inactiveColor = const Color.fromRGBO(72, 85, 101, 1);
  Color activeColor = const Color.fromRGBO(255, 111, 0, 1);

  List<NavItem> bottomNavItemList = [
    NavItem(name: '首页', icon: Icons.home_filled),
    NavItem(name: '我的', icon: Icons.person),
  ];
}

class NavItem {
  NavItem({required this.name, required this.icon});

  late String name;
  late IconData icon;
}

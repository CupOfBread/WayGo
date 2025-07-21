import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../component/bottom_nav_bar/bottom_nav_bar_logic.dart';
import '../../component/bottom_nav_bar/bottom_nav_bar_view.dart';
import '../../route/app_route.dart';
import '../home/home_view.dart';
import '../my/my_index/my_index_view.dart';
import 'root_logic.dart';
import 'root_state.dart';

class RootPage extends StatefulWidget {
  RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final RootLogic logic = Get.find<RootLogic>();
  final RootState state = Get.find<RootLogic>().state;
  final bottomBarLogic = Get.find<BottomNavBarLogic>();

  DateTime? _lastPressed;

  final List<Widget> _pages = [
    HomePage(),
    MyIndexPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        DateTime now = DateTime.now();
        if (_lastPressed == null ||
            now.difference(_lastPressed!) > const Duration(seconds: 2)) {
          _lastPressed = now;
          SmartDialog.dismiss(status: SmartStatus.toast);
          SmartDialog.showToast('再按一次返回键退出');
          return;
        }
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: bottomBarLogic.state.currentIndex.value,
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavBarComponent(),
      ),
    );
  }
}

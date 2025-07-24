import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:waygo/component/bottom_nav_bar/bottom_nav_bar_logic.dart';
import 'package:waygo/component/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:waygo/pages/home/home_view.dart';
import 'package:waygo/pages/my/my_index/my_index_view.dart';
import 'root_logic.dart';
import 'root_state.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final RootLogic logic = Get.put(RootLogic());
  final RootState state = Get.find<RootLogic>().state;
  final bottomBarLogic = Get.put(BottomNavBarLogic());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        DateTime now = DateTime.now();
        if (logic.state.lastPressed == null ||
            now.difference(logic.state.lastPressed!) > const Duration(seconds: 2)) {
          logic.state.lastPressed = now;
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
            children: [HomePage(), MyIndexPage()],
          ),
        ),
        bottomNavigationBar: BottomNavBarComponent(),
      ),
    );
  }
}

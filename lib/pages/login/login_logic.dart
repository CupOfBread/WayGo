import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_state.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  void login(BuildContext context, String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      SmartDialog.showToast('用户名和密码不能为空');
      return;
    }
    // 确认后再跳转
    Get.offAllNamed('/root');
  }
}

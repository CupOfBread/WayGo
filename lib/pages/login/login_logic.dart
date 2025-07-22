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
    // 弹出模态框
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('提示'),
        content: const Text('本APP正处于开发阶段'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('确认'),
          ),
        ],
      ),
    );
    // 确认后再跳转
    Get.offAllNamed('/root');
  }
}

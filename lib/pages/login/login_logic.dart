import 'package:get/get.dart';
import 'login_state.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  void login(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      SmartDialog.showToast('用户名和密码不能为空');
      return;
    }
    SmartDialog.showToast('登陆成功');
    Get.offAllNamed('/root');
  }
}

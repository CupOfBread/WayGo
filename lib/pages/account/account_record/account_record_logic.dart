import 'package:get/get.dart';

class AccountRecordLogic extends GetxController {
  // 分类
  final category = '景点'.obs;
  // 时间
  final dateTime = DateTime.now().toString().substring(0, 19).obs;

  void setCategory(String value) {
    category.value = value;
  }

  void setDateTime(String value) {
    dateTime.value = value;
  }
} 
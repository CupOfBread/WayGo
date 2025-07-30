import 'dart:convert';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'account_record_state.dart';
import 'package:waygo/model/account/account_record_type.dart';
import 'package:waygo/model/account/account_record_category.dart';
import 'package:waygo/model/user/user_info.dart';
import 'package:waygo/service/account_data_service.dart';

class AccountRecordLogic extends GetxController {
  final AccountRecordState state = AccountRecordState();

  // 选项列表
  late final RxList<AccountRecordType> types;
  late final RxList<AccountRecordCategory> categories;
  late final RxList<UserInfo> persons;

  @override
  void onInit() {
    types = <AccountRecordType>[].obs;
    categories = <AccountRecordCategory>[].obs;
    persons = state.persons.obs;
    _loadTypesAndCategories();
    super.onInit();
  }

  Future<void> _loadTypesAndCategories() async {
    final typeList = await AccountDataService.getAccountRecordTypes();
    final categoryList = await AccountDataService.getAccountRecordCategories();
    types.assignAll(typeList);
    categories.assignAll(categoryList);
    state.types = typeList;
    state.categories = categoryList;
  }

  void setTypeId(int id) => state.form.typeId.value = id;

  void setCategoryId(int id) => state.form.categoryId.value = id;

  void setAmount(String v) => state.form.amount.value = v;

  void setDateTime(String v) => state.form.dateTime.value = v;

  void setPayerId(int id) => state.form.payerId.value = id;

  void setParticipantIds(List<int> ids) =>
      state.form.participantIds.assignAll(ids);

  void setRemark(String v) => state.form.remark.value = v;

  void saveRecord() {
    SmartDialog.showToast(
      jsonEncode({
        'typeId': state.form.typeId.value,
        'categoryId': state.form.categoryId.value,
        'amount': state.form.amount.value,
        'dateTime': state.form.dateTime.value,
        'payerId': state.form.payerId.value,
        'participantIds': state.form.participantIds,
        'remark': state.form.remark.value,
      }),
    );
  }
}

import 'package:waygo/model/account/account_record_type.dart';
import 'package:waygo/model/account/account_record_category.dart';
import 'package:waygo/model/user_info.dart';
import 'package:get/get.dart';

class AccountRecordForm {
  RxInt typeId;
  RxInt categoryId;
  RxString amount;
  RxString dateTime;
  RxInt payerId;
  RxList<int> participantIds;
  RxString remark;

  AccountRecordForm({
    int typeId = 1,
    int categoryId = 1,
    String amount = '',
    String? dateTime,
    int payerId = 1,
    List<int>? participantIds,
    String remark = '',
  }) : typeId = typeId.obs,
       categoryId = categoryId.obs,
       amount = amount.obs,
       dateTime = (dateTime ?? DateTime.now().toString().substring(0, 19)).obs,
       payerId = payerId.obs,
       participantIds = (participantIds ?? <int>[]).obs,
       remark = remark.obs;
}

class AccountRecordState {
  AccountRecordForm form;
  List<AccountRecordType> types;
  List<AccountRecordCategory> categories;
  List<UserInfo> persons;

  AccountRecordState()
    : form = AccountRecordForm(),
      types = [
        AccountRecordType('expense', '', id: 1, name: '支出', isSysDefault: true, direction: -1),
        AccountRecordType('income', '', id: 2, name: '收入', isSysDefault: true, direction: 1),
        AccountRecordType('transfer', '', id: 3, name: '转账', isSysDefault: true, direction: -1),
        AccountRecordType('balance', '', id: 4, name: '余额', isSysDefault: true, direction: 1),
        AccountRecordType('refund', '', id: 5, name: '退款', isSysDefault: true, direction: 1),
      ],
      categories = [
        AccountRecordCategory('scenic', '', id: 1, name: '景点', isSysDefault: false),
        AccountRecordCategory('food', '', id: 2, name: '餐饮', isSysDefault: false),
        AccountRecordCategory('hotel', '', id: 3, name: '住宿', isSysDefault: false),
        AccountRecordCategory('traffic', '', id: 4, name: '交通', isSysDefault: false),
        AccountRecordCategory('shopping', '', id: 5, name: '购物', isSysDefault: false),
        AccountRecordCategory('entertainment', '', id: 6, name: '娱乐', isSysDefault: false),
        AccountRecordCategory('other', '', id: 7, name: '其他', isSysDefault: false),
        AccountRecordCategory('communication', '', id: 8, name: '通讯', isSysDefault: false),
        AccountRecordCategory('medical', '', id: 9, name: '医疗', isSysDefault: false),
        AccountRecordCategory('relationship', '', id: 10, name: '人情', isSysDefault: false),
      ],
      persons = [
        UserInfo('self', '', '', '', '', '自己', '', DateTime.now(), gender: 0, id: 1, username: 'self'),
        UserInfo('a', '', '', '', '', '同伴A', '', DateTime.now(), gender: 0, id: 2, username: 'a'),
        UserInfo('b', '', '', '', '', '同伴B', '', DateTime.now(), gender: 0, id: 3, username: 'b'),
        UserInfo('c', '', '', '', '', '同伴C', '', DateTime.now(), gender: 0, id: 4, username: 'c'),
      ];
}

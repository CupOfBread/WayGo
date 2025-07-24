import 'package:waygo/model/account_record_type.dart';
import 'package:waygo/model/account_record_category.dart';
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
        AccountRecordType('expense', false, '', id: 1, name: '支出'),
        AccountRecordType('income', false, '', id: 2, name: '收入'),
        AccountRecordType('transfer', false, '', id: 3, name: '转账'),
        AccountRecordType('balance', false, '', id: 4, name: '余额'),
        AccountRecordType('refund', false, '', id: 5, name: '退款'),
      ],
      categories = [
        AccountRecordCategory('communication', false, '', id: 8, name: '通讯'),
        AccountRecordCategory('medical', false, '', id: 9, name: '医疗'),
        AccountRecordCategory('relationship', false, '', id: 10, name: '人情'),
        AccountRecordCategory('scenic', false, '', id: 1, name: '景点'),
        AccountRecordCategory('food', false, '', id: 2, name: '餐饮'),
        AccountRecordCategory('hotel', false, '', id: 3, name: '住宿'),
        AccountRecordCategory('traffic', false, '', id: 4, name: '交通'),
        AccountRecordCategory('shopping', false, '', id: 5, name: '购物'),
        AccountRecordCategory('entertainment', false, '', id: 6, name: '娱乐'),
        AccountRecordCategory('other', false, '', id: 7, name: '其他'),
      ],
      persons = [
        UserInfo('self', 0, '', '', '', '', '自己', '', id: 1, username: 'self'),
        UserInfo('a', 0, '', '', '', '', '同伴A', '', id: 2, username: 'a'),
        UserInfo('b', 0, '', '', '', '', '同伴B', '', id: 3, username: 'b'),
        UserInfo('c', 0, '', '', '', '', '同伴C', '', id: 4, username: 'c'),
      ];
}

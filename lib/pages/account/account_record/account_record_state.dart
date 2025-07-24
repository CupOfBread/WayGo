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
      types = [],
      categories = [],
      persons = [
        UserInfo('self', '', '', '', '', '自己', '', DateTime.now(), gender: 0, id: 1, username: 'self'),
        UserInfo('a', '', '', '', '', '同伴A', '', DateTime.now(), gender: 0, id: 2, username: 'a'),
        UserInfo('b', '', '', '', '', '同伴B', '', DateTime.now(), gender: 0, id: 3, username: 'b'),
        UserInfo('c', '', '', '', '', '同伴C', '', DateTime.now(), gender: 0, id: 4, username: 'c'),
      ];
}

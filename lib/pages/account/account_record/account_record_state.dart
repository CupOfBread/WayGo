import 'package:waygo/model/account/account_record_type.dart';
import 'package:waygo/model/account/account_record_category.dart';
import 'package:waygo/model/user/user_info.dart';
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
        UserInfo(
          id: 1,
          code: 'self',
          name: '自己',
          gender: 0,
          username: 'self',
          phone: '',
          email: '',
          avatarUrl: '',
          description: '',
          location: '',
          birthday: DateTime.now(),
        ),
        UserInfo(
          id: 2,
          code: 'a',
          name: '同伴A',
          gender: 0,
          username: 'a',
          phone: '',
          email: '',
          avatarUrl: '',
          description: '',
          location: '',
          birthday: DateTime.now(),
        ),
        UserInfo(
          id: 3,
          code: 'b',
          name: '同伴B',
          gender: 0,
          username: 'b',
          phone: '',
          email: '',
          avatarUrl: '',
          description: '',
          location: '',
          birthday: DateTime.now(),
        ),
        UserInfo(
          id: 4,
          code: 'c',
          name: '同伴C',
          gender: 0,
          username: 'c',
          phone: '',
          email: '',
          avatarUrl: '',
          description: '',
          location: '',
          birthday: DateTime.now(),
        ),
      ];
}

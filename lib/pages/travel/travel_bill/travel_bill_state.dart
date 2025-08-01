import 'package:get/get.dart';

/// 旅行账单项目模型
class TravelBillItem {
  final String type;
  final String desc;
  final double amount;
  final String date;

  const TravelBillItem({
    required this.type,
    required this.desc,
    required this.amount,
    required this.date,
  });

  /// 从Map创建TravelBillItem对象
  factory TravelBillItem.fromMap(Map<String, dynamic> map) {
    return TravelBillItem(
      type: map['type'] ?? '',
      desc: map['desc'] ?? '',
      amount: (map['amount'] ?? 0.0).toDouble(),
      date: map['date'] ?? '',
    );
  }

  /// 转换为Map
  Map<String, dynamic> toMap() {
    return {'type': type, 'desc': desc, 'amount': amount, 'date': date};
  }
}

/// 旅行账单状态管理类
class TravelBillState {
  // 账单数据列表
  RxList<TravelBillItem> bills = <TravelBillItem>[].obs;

  // 加载状态
  RxBool isLoading = false.obs;

  // 错误信息
  RxString errorMessage = ''.obs;

  // 账单类型图标映射
  final Map<String, String> typeIcons = {
    '交通': 'directions_transit',
    '住宿': 'hotel',
    '美食': 'restaurant',
    '景点': 'place',
    '购物': 'shopping_bag',
    '活动': 'celebration',
    '其他': 'more_horiz',
  };

  TravelBillState() {
    // 初始化变量
  }
}

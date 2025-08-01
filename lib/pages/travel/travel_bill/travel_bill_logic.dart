import 'package:get/get.dart';
import 'travel_bill_state.dart';

class TravelBillLogic extends GetxController {
  final TravelBillState state = TravelBillState();

  @override
  void onInit() {
    super.onInit();
    loadBillData();
  }

  /// 加载账单数据
  Future<void> loadBillData() async {
    try {
      state.isLoading.value = true;
      state.errorMessage.value = '';

      // 模拟从服务获取数据
      await Future.delayed(const Duration(milliseconds: 500));

      // 初始化默认账单数据
      final List<Map<String, dynamic>> defaultBills = [
        {'type': '交通', 'desc': '地铁2号线', 'amount': 6.0, 'date': '2025-07-17'},
        {'type': '美食', 'desc': '宽窄巷子午餐', 'amount': 68.0, 'date': '2025-07-17'},
        {'type': '景点', 'desc': '大熊猫基地门票', 'amount': 55.0, 'date': '2025-07-17'},
        {'type': '住宿', 'desc': '成都中心假日酒店', 'amount': 420.0, 'date': '2025-07-17'},
        {'type': '交通', 'desc': '高铁到都江堰', 'amount': 25.0, 'date': '2025-07-18'},
        {'type': '购物', 'desc': '春熙路特产', 'amount': 120.0, 'date': '2025-07-19'},
        {'type': '活动', 'desc': '锦里古街变脸表演', 'amount': 80.0, 'date': '2025-07-19'},
        {'type': '其他', 'desc': '矿泉水', 'amount': 4.0, 'date': '2025-07-19'},
      ];

      final billItems = defaultBills.map((map) => TravelBillItem.fromMap(map)).toList();
      state.bills.value = billItems;
    } catch (e) {
      state.errorMessage.value = '加载数据失败: $e';
      // print('加载账单数据失败: $e');
    } finally {
      state.isLoading.value = false;
    }
  }

  /// 刷新数据
  Future<void> refreshData() async {
    await loadBillData();
  }

  /// 添加新账单
  void addBill(TravelBillItem bill) {
    state.bills.add(bill);
  }

  /// 删除账单
  void removeBill(int index) {
    if (index >= 0 && index < state.bills.length) {
      state.bills.removeAt(index);
    }
  }

  /// 更新账单
  void updateBill(int index, TravelBillItem bill) {
    if (index >= 0 && index < state.bills.length) {
      state.bills[index] = bill;
    }
  }

  /// 按类型筛选账单
  List<TravelBillItem> getBillsByType(String type) {
    return state.bills.where((bill) => bill.type == type).toList();
  }

  /// 按日期筛选账单
  List<TravelBillItem> getBillsByDate(String date) {
    return state.bills.where((bill) => bill.date == date).toList();
  }

  /// 获取所有账单类型
  List<String> getAllTypes() {
    return state.bills.map((bill) => bill.type).toSet().toList();
  }

  /// 获取所有日期
  List<String> getAllDates() {
    return state.bills.map((bill) => bill.date).toSet().toList()..sort();
  }
}

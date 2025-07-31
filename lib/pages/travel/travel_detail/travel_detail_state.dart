import 'package:get/get.dart';
import 'package:waygo/model/travel/travel.dart';

class TravelState {
  List<String> tabs = ['行程', '账单', '行李'];
  RxInt tabIndex = 0.obs;
  
  // 旅行计划数据
  Rx<TravelPlan?> travelPlan = Rx<TravelPlan?>(null);
  
  // 加载状态
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  
  TravelState() {
    /// 初始化变量
  }
} 
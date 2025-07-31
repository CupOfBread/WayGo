import 'package:get/get.dart';
import 'package:waygo/model/travel/travel.dart';

class TravelListState {
  // 使用TravelPlan模型替代硬编码的TravelInfo
  RxList<TravelPlan> travels = <TravelPlan>[].obs;
  
  // 添加加载状态
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  
  TravelListState() {
    // 初始化变量
  }
} 
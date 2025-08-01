import 'package:get/get.dart';
import 'package:waygo/model/travel/travel.dart';

class TravelItineraryState {
  // 行程数据
  RxList<Map<String, dynamic>> itineraryItems = <Map<String, dynamic>>[].obs;

  // 当前行程信息
  Rx<TravelItinerary?> currentItinerary = Rx<TravelItinerary?>(null);

  // 加载状态
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  // 编辑状态
  RxBool isEditing = false.obs;
  RxInt editingItemIndex = (-1).obs;

  // 筛选状态
  RxString selectedFilter = 'all'.obs;

  // 标签状态
  RxInt selectedDayIndex = 0.obs; // 选中的天数索引

  TravelItineraryState() {
    /// 初始化变量
  }
}

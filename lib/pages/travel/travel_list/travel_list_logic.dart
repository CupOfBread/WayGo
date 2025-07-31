import 'package:get/get.dart';
import 'package:waygo/service/travel_data_service.dart';
import 'travel_list_state.dart';

class TravelListLogic extends GetxController {
  final TravelListState state = TravelListState();

  @override
  void onInit() {
    super.onInit();
    loadTravelPlans();
  }

  /// 加载旅行计划数据
  Future<void> loadTravelPlans() async {
    try {
      state.isLoading.value = true;
      state.errorMessage.value = '';
      
      // 从service获取旅行计划数据
      final travelPlans = await TravelDataService.getTravelPlans();
      
      // 如果数据为空，初始化默认数据
      if (travelPlans.isEmpty) {
        await TravelDataService.initDefaultTravelData();
        final defaultPlans = await TravelDataService.getTravelPlans();
        state.travels.value = defaultPlans;
      } else {
        state.travels.value = travelPlans;
      }
      
      // 调试信息：打印加载的旅行计划数量
      print('加载的旅行计划数量: ${state.travels.length}');
      for (int i = 0; i < state.travels.length; i++) {
        print('旅行计划 ${i + 1}: ${state.travels[i].title}');
      }
      
    } catch (e) {
      state.errorMessage.value = '加载数据失败: $e';
      print('加载旅行计划失败: $e');
    } finally {
      state.isLoading.value = false;
    }
  }

  /// 刷新数据
  Future<void> refreshData() async {
    await loadTravelPlans();
  }
} 
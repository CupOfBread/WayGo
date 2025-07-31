import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:waygo/service/travel_data_service.dart';
import 'travel_detail_state.dart';

class TravelLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final TravelState state = TravelState();

  @override
  void onInit() {
    super.onInit();
    state.tabController = TabController(length: state.tabs.length, vsync: this);
    state.tabController!.addListener(() {
      if (!state.tabController!.indexIsChanging) {
        state.tabIndex.value = state.tabController!.index;
      }
    });
  }

  @override
  void onClose() {
    state.tabController?.dispose();
    super.onClose();
  }

  /// 根据ID加载旅行计划
  Future<void> loadTravelPlanById(int travelPlanId) async {
    try {
      state.isLoading.value = true;
      state.errorMessage.value = '';
      
      // 从service根据ID获取旅行计划
      final travelPlan = await TravelDataService.getTravelPlanById(travelPlanId);
      
      if (travelPlan != null) {
        state.travelPlan.value = travelPlan;
      } else {
        state.errorMessage.value = '未找到指定的旅行计划';
      }
    } catch (e) {
      state.errorMessage.value = '加载旅行计划失败: $e';
      print('加载旅行计划失败: $e');
    } finally {
      state.isLoading.value = false;
    }
  }
} 
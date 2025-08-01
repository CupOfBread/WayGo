import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:waygo/service/travel_data_service.dart';
import 'travel_detail_state.dart';

class TravelLogic extends GetxController {
  final TravelState state = TravelState();

  @override
  void onInit() {
    super.onInit();
  }

  /// 切换标签页
  void switchTab(int index) {
    state.tabIndex.value = index;
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

  /// 构建标签芯片
  Widget buildTagChip(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFF9800).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF9800).withValues(alpha: 0.3), width: 1),
      ),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFFF9800)),
      ),
    );
  }

  /// 构建状态芯片
  Widget buildStatusChip(int status) {
    String statusText;
    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case 0:
        statusText = '规划中';
        statusColor = const Color(0xFFFF9800);
        statusIcon = Icons.edit;
        break;
      case 1:
        statusText = '进行中';
        statusColor = const Color(0xFF4CAF50);
        statusIcon = Icons.play_arrow;
        break;
      case 2:
        statusText = '已完成';
        statusColor = const Color(0xFF2196F3);
        statusIcon = Icons.check_circle;
        break;
      case 3:
        statusText = '已取消';
        statusColor = const Color(0xFFF44336);
        statusIcon = Icons.cancel;
        break;
      default:
        statusText = '未知状态';
        statusColor = const Color(0xFF9E9E9E);
        statusIcon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusIcon, size: 14, color: statusColor),
          const SizedBox(width: 4),
          Text(
            statusText,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: statusColor),
          ),
        ],
      ),
    );
  }

  /// 构建信息芯片
  Widget buildInfoChip({required IconData icon, required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}

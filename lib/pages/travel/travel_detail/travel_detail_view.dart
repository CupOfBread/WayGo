import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/travel/travel_itinerary/travel_itinerary_view.dart';
import 'package:waygo/pages/travel/travel_luggage/travel_luggage_view.dart';
import 'package:waygo/common/log_util.dart';
import 'travel_detail_logic.dart';
import '../travel_bill/travel_bill_view.dart';

class TravelPage extends StatelessWidget {
  final int travelPlanId;

  const TravelPage({Key? key, required this.travelPlanId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TravelLogic());
    final state = logic.state;

    // 根据ID加载旅行计划数据
    logic.loadTravelPlanById(travelPlanId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('旅程详情'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Obx(() {
        if (state.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => logic.loadTravelPlanById(travelPlanId),
                  child: const Text('重试'),
                ),
              ],
            ),
          );
        }

        final travelPlan = state.travelPlan.value;
        if (travelPlan == null) {
          return const Center(child: Text('未找到旅行计划'));
        }

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      travelPlan.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${travelPlan.startDate.year}.${travelPlan.startDate.month.toString().padLeft(2, '0')}.${travelPlan.startDate.day.toString().padLeft(2, '0')}-${travelPlan.endDate.year}.${travelPlan.endDate.month.toString().padLeft(2, '0')}.${travelPlan.endDate.day.toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 81, 4, 0.08),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '${travelPlan.totalDays}天${travelPlan.totalDays - 1}晚',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(111, 34, 187, 1.0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFF4A90E2).withAlpha((0.08 * 255).toInt()),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            travelPlan.totalDistance?.toStringAsFixed(1) != null
                                ? '${travelPlan.totalDistance!.toStringAsFixed(1)}km'
                                : '距离未设置',
                            style: const TextStyle(fontSize: 14, color: Color(0xFF4A90E2)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // 自定义的标签切换按钮
                    Row(
                      children:
                          state.tabs.asMap().entries.map((entry) {
                            final index = entry.key;
                            final tab = entry.value;
                            final isSelected = state.tabIndex.value == index;

                            return Expanded(
                              child: GestureDetector(
                                onTap: () => logic.switchTab(index),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color:
                                            isSelected
                                                ? const Color.fromRGBO(255, 81, 4, 1)
                                                : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    tab,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      color:
                                          isSelected
                                              ? const Color.fromRGBO(255, 81, 4, 1)
                                              : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // 内容区域
            SliverToBoxAdapter(
              child: Obx(() {
                LogUtil.info('当前index: ${state.tabIndex.value}');
                switch (state.tabIndex.value) {
                  case 0:
                    return const TravelItineraryPage();
                  case 1:
                    return const TravelBillPage();
                  case 2:
                    return const TravelLuggagePage();
                  default:
                    return const SizedBox.shrink();
                }
              }),
            ),
          ],
        );
      }),
    );
  }
}

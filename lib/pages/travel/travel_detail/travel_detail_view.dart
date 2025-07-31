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
          return const Center(
            child: CircularProgressIndicator(),
          );
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
          return const Center(
            child: Text('未找到旅行计划'),
          );
        }
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    travelPlan.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(
                            0xFF4A90E2,
                          ).withAlpha((0.08 * 255).toInt()),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          travelPlan.totalDistance?.toStringAsFixed(1) != null 
                            ? '${travelPlan.totalDistance!.toStringAsFixed(1)}km'
                            : '距离未设置',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4A90E2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // TabBar放在这里
                  GetBuilder<TravelLogic>(
                    builder:
                        (_) => TabBar(
                          controller: state.tabController,
                          tabs: state.tabs.map((e) => Tab(text: e)).toList(),
                          labelColor: const Color.fromRGBO(255, 81, 4, 1),
                          unselectedLabelColor: Colors.black87,
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          indicatorColor: const Color.fromRGBO(255, 81, 4, 1),
                          indicatorWeight: 3,
                        ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: GetBuilder<TravelLogic>(
                builder:
                    (_) => TabBarView(
                      controller: state.tabController,
                      children: const [
                        TravelItineraryPage(),
                        TravelBillPage(),
                        TravelLuggagePage(),
                      ],
                    ),
              ),
            ),
            ),
            // index变化时打印
            Obx(() {
              LogUtil.info('当前index: ${state.tabIndex.value}');
              return const SizedBox.shrink();
            }),
          ],
        );
      }),
    );
  }
}

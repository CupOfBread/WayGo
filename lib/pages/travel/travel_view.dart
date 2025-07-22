import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/travel/travel_itinerary/travel_itinerary_page.dart';
import 'package:waygo/pages/travel/travel_luggage/travel_luggage_page.dart';
import 'package:waygo/common/log_util.dart';
import 'travel_logic.dart';
import 'travel_state.dart';
import 'travel_bill/travel_bill_page.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TravelLogic());
    final state = logic.state;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('旅行'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '成都旅行计划',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                    const Text(
                      '2025.7.17-2025.7.24',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
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
                      child: const Text(
                        '8天7晚',
                        style: TextStyle(
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
                        color: Color(0xFF4A90E2).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        '114.514km',
                        style: TextStyle(
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
                  builder: (_) => TabBar(
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
                builder: (_) => TabBarView(
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
            LogUtil.info('当前index: \\${state.tabIndex.value}');
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}

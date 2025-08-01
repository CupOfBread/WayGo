import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'travel_itinerary_logic.dart';
import 'travel_itinerary_state.dart';

class TravelItineraryPage extends StatelessWidget {
  const TravelItineraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TravelItineraryLogic logic = Get.put(TravelItineraryLogic());
    final TravelItineraryState state = logic.state;

    return Obx(() {
      if (state.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state.errorMessage.value.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.errorMessage.value),
              ElevatedButton(onPressed: () => logic.initSampleData(), child: const Text('重试')),
            ],
          ),
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 天数标签组件
          logic.buildDayTags(),
          // 行程内容
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children:
                    state.itineraryItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      switch (item['type']) {
                        case 'traffic':
                          return logic.buildTrafficItem(item, index);
                        default:
                          return logic.buildGeneralItem(item, index);
                      }
                    }).toList(),
              ),
            ),
          ),
        ],
      );
    });
  }

  
}

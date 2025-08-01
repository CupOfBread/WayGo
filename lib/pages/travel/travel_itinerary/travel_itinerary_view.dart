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

      return SingleChildScrollView(
        child: Column(
          children:
              state.itineraryItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                switch (item['type']) {
                  case 'traffic':
                    return _buildTraffic(item, index);
                  default:
                    return logic.buildGeneralItem(item, index);
                }
              }).toList(),
        ),
      );
    });
  }

  Widget _buildTraffic(Map<String, dynamic> item, int index) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              item['mode'] == '自驾' ? Icons.directions_car : Icons.directions_transit,
              color: Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${item['mode'] ?? ''}${item['desc'] != null ? ' - ${item['desc']}' : ''}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'travel_list_logic.dart';
import 'package:waygo/pages/travel/travel_view.dart';

class TravelListPage extends StatelessWidget {
  const TravelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TravelListLogic());
    final state = logic.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('旅程列表'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.travels.length,
        itemBuilder: (context, index) {
          final travel = state.travels[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _TravelCard(travel: travel),
          );
        },
      ),
    );
  }
}

class _TravelCard extends StatelessWidget {
  final TravelInfo travel;
  const _TravelCard({required this.travel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DefaultTabController(length: 3, child: TravelPage()));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha((0.08 * 255).toInt()),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      travel.title,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      travel.departureDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '共${travel.members}名成员',
                      style: const TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 1,
              height: 80,
              color: Colors.grey.shade200,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('时长：${travel.duration}', style: const TextStyle(fontSize: 12, color: Colors.deepOrange)),
                    Text('里程：约${travel.distance}KM', style: const TextStyle(fontSize: 12, color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelInfo {
  final String title;
  final String departureDate;
  final int members;
  final String duration;
  final String distance;
  TravelInfo({
    required this.title,
    required this.departureDate,
    required this.members,
    required this.duration,
    required this.distance,
  });
} 
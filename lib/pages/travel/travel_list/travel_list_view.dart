import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/travel/travel_list/travel_list_logic.dart';
import 'package:waygo/pages/travel/travel_detail/travel_detail_view.dart';
import 'package:waygo/model/travel/travel.dart';

class TravelListPage extends StatelessWidget {
  const TravelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TravelListLogic());
    final state = logic.state;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '旅程列表',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Color(0xFF666666),
            ),
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.refresh,
                size: 18,
                color: Color(0xFF666666),
              ),
            ),
            onPressed: () => logic.refreshData(),
          ),
        ],
      ),
      backgroundColor: Colors.white,
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
                  onPressed: () => logic.refreshData(),
                  child: const Text('重试'),
                ),
              ],
            ),
          );
        }
        
        if (state.travels.isEmpty) {
          return const Center(
            child: Text('暂无旅程数据'),
          );
        }
        
        return RefreshIndicator(
          onRefresh: logic.refreshData,
          child: ListView.builder(
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
      }),
    );
  }
}

class _TravelCard extends StatelessWidget {
  final TravelPlan travel;
  const _TravelCard({required this.travel});

  @override
  Widget build(BuildContext context) {
    // 计算旅程时长
    final duration = travel.endDate.difference(travel.startDate).inDays + 1;
    final durationText = '${duration}天${duration - 1}晚';
    
    // 格式化出发日期
    final departureDate = '${travel.startDate.year}.${travel.startDate.month.toString().padLeft(2, '0')}.${travel.startDate.day.toString().padLeft(2, '0')}';
    
    // 计算成员数量（创建者 + 参与者）
    final members = 1 + travel.participantIds.length;
    
    return GestureDetector(
      onTap: () {
        Get.to(() => DefaultTabController(length: 3, child: TravelPage(travelPlanId: travel.id)));
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
                      departureDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '共${members}名成员',
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
                    Text('时长：$durationText', style: const TextStyle(fontSize: 12, color: Colors.deepOrange)),
                    Text('里程：约${travel.totalDistance?.toStringAsFixed(1) ?? '0.0'}KM', style: const TextStyle(fontSize: 12, color: Colors.blue)),
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
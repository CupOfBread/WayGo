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
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          '旅程详情',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A)),
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
            child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Color(0xFF666666)),
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (state.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6C63FF)),
                ),
                SizedBox(height: 16),
                Text('加载中...', style: TextStyle(color: Color(0xFF666666), fontSize: 14)),
              ],
            ),
          );
        }

        if (state.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, size: 48, color: Colors.red[300]),
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage.value,
                        style: const TextStyle(color: Color(0xFF666666), fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => logic.loadTravelPlanById(travelPlanId),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C63FF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('重试'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        final travelPlan = state.travelPlan.value;
        if (travelPlan == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.search_off, size: 48, color: Color(0xFFCCCCCC)),
                      SizedBox(height: 16),
                      Text('未找到旅行计划', style: TextStyle(color: Color(0xFF666666), fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            // 头部信息卡片
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // 封面图片区域
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF6C63FF), Color(0xFF8B7CF6)],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -20,
                            bottom: -20,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  travelPlan.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${travelPlan.startDate.year}.${travelPlan.startDate.month.toString().padLeft(2, '0')}.${travelPlan.startDate.day.toString().padLeft(2, '0')} - ${travelPlan.endDate.year}.${travelPlan.endDate.month.toString().padLeft(2, '0')}.${travelPlan.endDate.day.toString().padLeft(2, '0')}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 详细信息区域
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // 标签信息
                          Row(
                            children: [
                              _buildInfoChip(
                                icon: Icons.calendar_today,
                                label: '${travelPlan.totalDays}天${travelPlan.totalDays - 1}晚',
                                color: const Color(0xFF6C63FF),
                              ),
                              const SizedBox(width: 12),
                              _buildInfoChip(
                                icon: Icons.straighten,
                                label:
                                    travelPlan.totalDistance?.toStringAsFixed(1) != null
                                        ? '${travelPlan.totalDistance!.toStringAsFixed(1)}km'
                                        : '距离未设置',
                                color: const Color(0xFF4CAF50),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // 标签切换
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children:
                                  state.tabs.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final tab = entry.value;
                                    final isSelected = state.tabIndex.value == index;

                                    return Expanded(
                                      child: GestureDetector(
                                        onTap: () => logic.switchTab(index),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          decoration: BoxDecoration(
                                            color: isSelected ? Colors.white : Colors.transparent,
                                            borderRadius: BorderRadius.circular(16),
                                            boxShadow:
                                                isSelected
                                                    ? [
                                                      BoxShadow(
                                                        color: Colors.black.withValues(alpha: 0.05),
                                                        blurRadius: 8,
                                                        offset: const Offset(0, 2),
                                                      ),
                                                    ]
                                                    : null,
                                          ),
                                          child: Text(
                                            tab,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight:
                                                  isSelected ? FontWeight.w600 : FontWeight.w500,
                                              color:
                                                  isSelected
                                                      ? const Color(0xFF6C63FF)
                                                      : const Color(0xFF666666),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 内容区域
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
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
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        );
      }),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}

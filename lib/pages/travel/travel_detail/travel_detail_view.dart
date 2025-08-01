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
      floatingActionButton: Obx(() {
        if (state.tabIndex.value == 0) {
          return FloatingActionButton.extended(
            onPressed: () {
              print('新增项目');
            },
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            elevation: 4,
            label: const Text('新增项目', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          );
        }
        return const SizedBox.shrink();
      }),
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

        return SingleChildScrollView(
          child: Column(
            children: [
              // 头部信息卡片
              Container(
                margin: const EdgeInsets.all(10),
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
                    Container(
                      height: 130,
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    travelPlan.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        travelPlan.startDate.year == travelPlan.endDate.year
                                            ? '${travelPlan.startDate.month}.${travelPlan.startDate.day.toString().padLeft(2, '0')} - ${travelPlan.endDate.month}.${travelPlan.endDate.day.toString().padLeft(2, '0')}'
                                            : '${travelPlan.startDate.year}.${travelPlan.startDate.month}.${travelPlan.startDate.day.toString().padLeft(2, '0')} - ${travelPlan.endDate.year}.${travelPlan.endDate.month}.${travelPlan.endDate.day.toString().padLeft(2, '0')}',
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
                          ),
                        ],
                      ),
                    ),
                    // 详细信息区域
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          // 第一行标签：状态、天数、里程
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              logic.buildStatusChip(travelPlan.status),
                              const SizedBox(width: 8),
                              logic.buildInfoChip(
                                icon: Icons.calendar_today,
                                label: '${travelPlan.totalDays}天${travelPlan.totalDays - 1}晚',
                                color: const Color(0xFF6C63FF),
                              ),
                              const SizedBox(width: 8),
                              logic.buildInfoChip(
                                icon: Icons.straighten,
                                label:
                                    travelPlan.totalDistance?.toStringAsFixed(1) != null
                                        ? '${travelPlan.totalDistance!.toStringAsFixed(1)}km'
                                        : '距离未设置',
                                color: const Color(0xFF4CAF50),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // 第二行标签：自定义标签
                          if (travelPlan.tags != null && travelPlan.tags!.isNotEmpty)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...travelPlan.tags!
                                    .split(',')
                                    .map((tag) => tag.trim())
                                    .where((tag) => tag.isNotEmpty)
                                    .map((tag) => logic.buildTagChip(tag))
                                    .toList()
                                    .asMap()
                                    .entries
                                    .map(
                                      (entry) => [
                                        if (entry.key > 0) const SizedBox(width: 8),
                                        entry.value,
                                      ],
                                    )
                                    .expand((widgets) => widgets)
                                    .toList(),
                                const Spacer(),
                              ],
                            ),
                          if (travelPlan.tags != null && travelPlan.tags!.isNotEmpty)
                            const SizedBox(height: 16),
                          // 描述信息
                          if (travelPlan.description != null &&
                              travelPlan.description!.isNotEmpty) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Icon(
                                    Icons.description_outlined,
                                    size: 14,
                                    color: Color(0xFF6C63FF),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '计划描述',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6C63FF),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        travelPlan.description!,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF333333),
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                          const SizedBox(height: 8),
                          // 创建时间信息
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.schedule_outlined,
                                  size: 14,
                                  color: Color(0xFF4CAF50),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '创建时间',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${travelPlan.createTime.year}-${travelPlan.createTime.month.toString().padLeft(2, '0')}-${travelPlan.createTime.day.toString().padLeft(2, '0')} ${travelPlan.createTime.hour.toString().padLeft(2, '0')}:${travelPlan.createTime.minute.toString().padLeft(2, '0')}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF333333),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
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
                                          padding: const EdgeInsets.symmetric(vertical: 6),
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
                                              fontSize: 14,
                                              fontWeight:
                                                  isSelected ? FontWeight.w600 : FontWeight.w400,
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
              // 内容区域
              Obx(() {
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
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}

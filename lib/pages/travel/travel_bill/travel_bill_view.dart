import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'travel_bill_logic.dart';

class TravelBillPage extends StatelessWidget {
  const TravelBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TravelBillLogic logic = Get.put(TravelBillLogic());

    return Obx(() {
      if (logic.state.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (logic.state.errorMessage.value.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(logic.state.errorMessage.value, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () => logic.refreshData(), child: const Text('重试')),
            ],
          ),
        );
      }

      return Column(
        children: [
          // 统计卡片
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(16),
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
                const Text('账单统计', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                const Text(
                  '暂无数据',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                // 占位内容
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text('统计信息', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // 账单列表
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
              child: Column(
                children:
                    logic.state.bills.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              leading: Icon(_getIconForType(item.type), color: Colors.blue),
                              title: Text(
                                item.desc,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${item.type} · ${item.date}'),
                              trailing: Text(
                                '￥${item.amount.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 16, color: Colors.red),
                              ),
                              // 移除点击事件，不需要展示账单详情
                            ),
                          ),
                          if (index < logic.state.bills.length - 1) const SizedBox(height: 8),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      );
    });
  }

  /// 根据类型获取对应的图标
  IconData _getIconForType(String type) {
    final Map<String, IconData> typeIcons = {
      '交通': Icons.directions_transit,
      '住宿': Icons.hotel,
      '美食': Icons.restaurant,
      '景点': Icons.place,
      '购物': Icons.shopping_bag,
      '活动': Icons.celebration,
      '其他': Icons.more_horiz,
    };
    return typeIcons[type] ?? Icons.receipt;
  }
}

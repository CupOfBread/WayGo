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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 总支出标题
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.account_balance_wallet, color: Colors.blue, size: 13),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '总支出',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // 总支出金额
                const Text('¥ 2,580.00', style: TextStyle(fontSize: 26, color: Colors.black87)),
                const SizedBox(height: 12),

                // 进度条和预算信息
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 进度条
                    Container(
                      width: double.infinity,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.65, // 65% 的进度
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 预算信息行
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 总预算
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('总预算', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 4),
                            const Text(
                              '¥4,000.00',
                              style: TextStyle(fontSize: 15, color: Color(0xFF4C4C4C)),
                            ),
                          ],
                        ),

                        // 剩余金额
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('剩余', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 4),
                            const Text(
                              '¥1,420.00',
                              style: TextStyle(fontSize: 15, color: Color(0xFF424242)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
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

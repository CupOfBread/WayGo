import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stamp_collection_logic.dart';

class StampCollectionPage extends StatelessWidget {
  const StampCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 假数据
    final stamps = [
      {'name': '北京天安门', 'date': '2023-05-01', 'place': '北京', 'collected': true},
      {'name': '上海外滩', 'date': '2023-06-15', 'place': '上海', 'collected': true},
      {'name': '西湖印章', 'date': '2023-07-10', 'place': '杭州', 'collected': true},
      {'name': '布达拉宫', 'date': '2023-08-20', 'place': '拉萨', 'collected': false},
      {'name': '长城印章', 'date': '', 'place': '北京', 'collected': false},
      {'name': '东方明珠', 'date': '', 'place': '上海', 'collected': false},
      {'name': '广州塔', 'date': '2023-09-12', 'place': '广州', 'collected': true},
      {'name': '南京夫子庙', 'date': '', 'place': '南京', 'collected': false},
      {'name': '成都大熊猫基地', 'date': '', 'place': '成都', 'collected': false},
      {'name': '深圳湾公园', 'date': '2023-10-05', 'place': '深圳', 'collected': true},
      {'name': '重庆洪崖洞', 'date': '', 'place': '重庆', 'collected': false},
      {'name': '哈尔滨冰雪大世界', 'date': '', 'place': '哈尔滨', 'collected': false},
      {'name': '青岛栈桥', 'date': '', 'place': '青岛', 'collected': false},
      {'name': '苏州园林', 'date': '', 'place': '苏州', 'collected': false},
      {'name': '厦门鼓浪屿', 'date': '', 'place': '厦门', 'collected': false},
    ];
    final collectedCount = stamps.where((s) => s['collected'] as bool).length;
    final totalCount = stamps.length;

    Get.put(StampCollectionLogic());
    return Scaffold(
      appBar: AppBar(title: const Text('我的集章')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text('已集章 $collectedCount / $totalCount', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final stamp = stamps[index];
                  final collected = stamp['collected'] as bool;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: collected ? Colors.orange.shade100 : Colors.grey.shade200,
                              border: Border.all(
                                color: collected ? Colors.orange : Colors.grey,
                                width: 4,
                                style: collected ? BorderStyle.solid : BorderStyle.solid,
                              ),
                              boxShadow: collected
                                  ? [BoxShadow(color: Colors.orange.withAlpha((0.2 * 255).toInt()), blurRadius: 8, spreadRadius: 2)]
                                  : [],
                            ),
                            child: Icon(Icons.verified, size: 44, color: collected ? Colors.orange : Colors.grey),
                          ),
                          if (!collected)
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 4,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(stamp['name'] as String, style: TextStyle(fontWeight: FontWeight.bold, color: collected ? Colors.orange.shade800 : Colors.grey)),
                      const SizedBox(height: 6),
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Column(
                            children: [
                              Text(stamp['place'] as String, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                              const SizedBox(height: 2),
                              collected && stamp['date'] != ''
                                  ? Text('获得于 ${stamp['date']}', style: const TextStyle(fontSize: 11, color: Colors.green))
                                  : const Text('未获得', style: TextStyle(fontSize: 11, color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: stamps.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 0.85,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

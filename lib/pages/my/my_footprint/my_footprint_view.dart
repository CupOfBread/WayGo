import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFootprintPage extends StatelessWidget {
  const MyFootprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 假数据
    final countries = 8;
    final cities = 23;
    final places = ['北京', '上海', '东京', '巴黎', '纽约', '拉萨', '三亚', '哈尔滨'];
    final mostSeason = '秋季';
    final highestPlace = '珠穆朗玛峰 (8848m)';
    final southestPlace = '三亚';
    final northestPlace = '漠河';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '我的足迹',
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
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.public, color: Colors.orange),
              title: const Text('去过的国家'),
              trailing: Text('$countries 个', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.location_city, color: Colors.blue),
              title: const Text('去过的城市'),
              trailing: Text('$cities 个', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('去过的地点', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: places.map((p) => Chip(label: Text(p))).toList(),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.green),
              title: const Text('出行最多的季节'),
              trailing: Text(mostSeason, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.terrain, color: Colors.brown),
              title: const Text('去过海拔最高的地方'),
              trailing: Text(highestPlace, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.south, color: Colors.red),
              title: const Text('去过最南的地方'),
              trailing: Text(southestPlace, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.north, color: Colors.indigo),
              title: const Text('去过最北的地方'),
              trailing: Text(northestPlace, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
} 
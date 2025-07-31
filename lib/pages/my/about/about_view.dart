import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '关于',
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            const SizedBox(height: 24),
            const Text(
              'WayGo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              '版本 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Text(
              'WayGo 是一款杂糅的旅行美食APP，啥都往里面加！',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const Text(
              '开发者：一杯面包',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            const Text(
              '联系方式：CupOfBread',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/account/account_detail/account_detail_view.dart';

class AccountListPage extends StatelessWidget {
  const AccountListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('账本列表'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 模仿随手记账本卡片
          _buildAccountBookCard(context, '生活账本', '2024年', Colors.deepPurpleAccent),
          const SizedBox(height: 16),
          _buildAccountBookCard(context, '旅行账本', '2023年', Colors.blueAccent),
          const SizedBox(height: 16),
          _buildAccountBookCard(context, '工作账本', '2022年', Colors.green),
          // 可继续添加更多账本
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: '新建账本',
      ),
    );
  }

  Widget _buildAccountBookCard(BuildContext context, String title, String subtitle, Color color) {
    return GestureDetector(
      onTap: () {
        // 跳转到账本详情页面
        Get.to(() => const AccountDetailPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withAlpha((0.1 * 255).toInt()),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha((0.15 * 255).toInt()),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          children: [
            Icon(Icons.book, color: color, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
                  const SizedBox(height: 8),
                  Text(subtitle, style: TextStyle(fontSize: 14, color: color.withAlpha((0.7 * 255).toInt()))),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18)
          ],
        ),
      ),
    );
  }
} 
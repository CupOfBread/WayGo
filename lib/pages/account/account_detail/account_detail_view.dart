import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../account_record/account_record_view.dart';
// 移除 fl_chart 相关 import

class AccountDetailPage extends StatelessWidget {
  const AccountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('账本详情'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildBookInfo(),
          const SizedBox(height: 16),
          _buildStatistics(),
          const SizedBox(height: 16),
          _buildTrendChart(),
          const SizedBox(height: 16),
          const Text('账单明细', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildBillItem('早餐', '-12.00', '2024-06-01', Colors.orange),
          _buildBillItem('工资', '+5000.00', '2024-06-01', Colors.green),
          _buildBillItem('交通', '-3.00', '2024-06-01', Colors.blue),
          _buildBillItem('电影', '-45.00', '2024-05-31', Colors.purple),
          _buildBillItem('转账', '+200.00', '2024-05-30', Colors.teal),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 跳转到记一笔页面
          Get.to(() => const AccountRecordPage());
        },
        child: const Icon(Icons.edit),
        tooltip: '记一笔',
      ),
    );
  }

  Widget _buildBookInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.book, color: Colors.deepPurple, size: 40),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('生活账本', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              SizedBox(height: 8),
              Text('2024年', style: TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _StatisticItem(label: '本月支出', value: '¥1200.00', color: Colors.red),
          _StatisticItem(label: '本月收入', value: '¥5000.00', color: Colors.green),
          _StatisticItem(label: '余额', value: '¥3800.00', color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildTrendChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('收支趋势', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: CustomPaint(
              painter: _SimpleLineChartPainter(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('1月', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text('2月', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text('3月', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text('4月', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text('5月', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBillItem(String title, String amount, String date, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.category, color: color),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(amount, style: TextStyle(color: amount.startsWith('-') ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _StatisticItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatisticItem({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

// 预留记一笔页面跳转
// 删除本文件内的AccountRecordPage类定义

class _SimpleLineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final paint2 = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // 支出数据
    final points = [
      Offset(size.width * 0.0, size.height * 0.7),
      Offset(size.width * 0.25, size.height * 0.6),
      Offset(size.width * 0.5, size.height * 0.8),
      Offset(size.width * 0.75, size.height * 0.5),
      Offset(size.width * 1.0, size.height * 0.75),
    ];
    // 收入数据
    final points2 = [
      Offset(size.width * 0.0, size.height * 0.3),
      Offset(size.width * 0.25, size.height * 0.2),
      Offset(size.width * 0.5, size.height * 0.4),
      Offset(size.width * 0.75, size.height * 0.35),
      Offset(size.width * 1.0, size.height * 0.2),
    ];
    // 绘制折线
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
      canvas.drawLine(points2[i], points2[i + 1], paint2);
    }
    // 可选：绘制点
    final dotPaint = Paint()..color = Colors.red;
    final dotPaint2 = Paint()..color = Colors.green;
    for (final p in points) {
      canvas.drawCircle(p, 3, dotPaint);
    }
    for (final p in points2) {
      canvas.drawCircle(p, 3, dotPaint2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 
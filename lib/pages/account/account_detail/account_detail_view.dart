import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/account/account_record/account_record_view.dart';
import 'package:waygo/model/account/account_book.dart';

// 新增内部数据结构
class _RecordWithDirection {
  final AccountRecord record;
  final int direction;
  _RecordWithDirection(this.record, this.direction);
}

class AccountDetailPage extends StatelessWidget {
  const AccountDetailPage({Key? key}) : super(key: key);

  // 直接对象List，包含direction
  List<_RecordWithDirection> get _records => [
        _RecordWithDirection(
          AccountRecord(
            id: 1,
            accountBookId: 1,
            typeId: 1,
            categoryId: 1,
            amount: 12.0,
            createTime: DateTime(2024, 6, 1, 8, 30),
            payerId: 1,
            participantIds: [2, 3],
            remark: '早餐',
          ),
          -1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 2,
            accountBookId: 1,
            typeId: 2,
            categoryId: 2,
            amount: 5000.0,
            createTime: DateTime(2024, 6, 1, 9, 0),
            payerId: 1,
            participantIds: [2],
            remark: '工资',
          ),
          1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 3,
            accountBookId: 1,
            typeId: 3,
            categoryId: 6,
            amount: 100.0,
            createTime: DateTime(2024, 6, 1, 10, 0),
            payerId: 1,
            participantIds: [2],
            remark: '借入',
          ),
          1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 4,
            accountBookId: 1,
            typeId: 4,
            categoryId: 7,
            amount: 50.0,
            createTime: DateTime(2024, 6, 1, 11, 0),
            payerId: 1,
            participantIds: [2],
            remark: '还款',
          ),
          -1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 5,
            accountBookId: 1,
            typeId: 1,
            categoryId: 3,
            amount: 3.0,
            createTime: DateTime(2024, 6, 1, 8, 50),
            payerId: 1,
            participantIds: [2],
            remark: '交通',
          ),
          -1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 6,
            accountBookId: 1,
            typeId: 5,
            categoryId: 5,
            amount: 200.0,
            createTime: DateTime(2024, 5, 30, 15, 0),
            payerId: 1,
            participantIds: [2],
            remark: '转账',
          ),
          1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 7,
            accountBookId: 1,
            typeId: 1,
            categoryId: 1,
            amount: 18.0,
            createTime: DateTime(2024, 5, 29, 7, 30),
            payerId: 1,
            participantIds: [2],
            remark: '午餐',
          ),
          -1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 8,
            accountBookId: 1,
            typeId: 1,
            categoryId: 1,
            amount: 25.0,
            createTime: DateTime(2024, 5, 28, 19, 0),
            payerId: 1,
            participantIds: [2],
            remark: '晚餐',
          ),
          -1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 9,
            accountBookId: 1,
            typeId: 3,
            categoryId: 6,
            amount: 200.0,
            createTime: DateTime(2024, 5, 27, 8, 40),
            payerId: 1,
            participantIds: [2],
            remark: '借入',
          ),
          1,
        ),
        _RecordWithDirection(
          AccountRecord(
            id: 10,
            accountBookId: 1,
            typeId: 4,
            categoryId: 7,
            amount: 100.0,
            createTime: DateTime(2024, 5, 26, 10, 0),
            payerId: 1,
            participantIds: [2],
            remark: '还款',
          ),
          -1,
        ),
      ];

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
          ..._records.map((e) => _buildBillItem(e.record, e.direction)).toList(),
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
        color: Colors.deepPurpleAccent.withAlpha((0.08 * 255).toInt()),
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
            color: Colors.grey.withAlpha((0.08 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _StatisticItem(label: '支出', value: '-¥1200.00', color: Colors.red),
          _StatisticItem(label: '收入', value: '+¥5000.00', color: Colors.green),
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
            color: Colors.grey.withAlpha((0.08 * 255).toInt()),
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

  Widget _buildBillItem(AccountRecord record, int direction) {
    // 类型和颜色映射
    final typeMap = {1: '支出', 2: '收入', 3: '借入', 4: '还款', 5: '转账'};
    final categoryMap = {
      1: '餐饮',
      2: '工资',
      3: '交通',
      4: '娱乐',
      5: '转账',
      6: '借入',
      7: '还款',
    };
    final colorMap = {
      1: Colors.orange,
      2: Colors.green,
      3: Colors.blue,
      4: Colors.purple,
      5: Colors.teal,
      6: Colors.brown,
      7: Colors.redAccent,
    };
    final amountStr = (direction == 1 ? '+' : '-') + record.amount.toStringAsFixed(2);
    final dateStr = '${record.createTime.year}-${record.createTime.month.toString().padLeft(2, '0')}-${record.createTime.day.toString().padLeft(2, '0')}';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.category, color: colorMap[record.categoryId] ?? Colors.grey),
        title: Text(record.remark ?? categoryMap[record.categoryId] ?? '账单'),
        subtitle: Text('$dateStr  ${typeMap[record.typeId] ?? ''}'),
        trailing: Text(amountStr, style: TextStyle(color: direction == 1 ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
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
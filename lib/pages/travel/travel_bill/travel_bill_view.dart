import 'package:flutter/material.dart';

class TravelBillPage extends StatelessWidget {
  const TravelBillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bills = [
      {
        'type': '交通',
        'desc': '地铁2号线',
        'amount': 6.0,
        'date': '2025-07-17',
      },
      {
        'type': '美食',
        'desc': '宽窄巷子午餐',
        'amount': 68.0,
        'date': '2025-07-17',
      },
      {
        'type': '景点',
        'desc': '大熊猫基地门票',
        'amount': 55.0,
        'date': '2025-07-17',
      },
      {
        'type': '住宿',
        'desc': '成都中心假日酒店',
        'amount': 420.0,
        'date': '2025-07-17',
      },
      {
        'type': '交通',
        'desc': '高铁到都江堰',
        'amount': 25.0,
        'date': '2025-07-18',
      },
      {
        'type': '美食',
        'desc': '青城山农家乐晚餐',
        'amount': 90.0,
        'date': '2025-07-18',
      },
      {
        'type': '住宿',
        'desc': '青城山下民宿',
        'amount': 260.0,
        'date': '2025-07-18',
      },
      {
        'type': '购物',
        'desc': '春熙路特产',
        'amount': 120.0,
        'date': '2025-07-19',
      },
      {
        'type': '活动',
        'desc': '锦里古街变脸表演',
        'amount': 80.0,
        'date': '2025-07-19',
      },
      {
        'type': '其他',
        'desc': '矿泉水',
        'amount': 4.0,
        'date': '2025-07-19',
      },
    ];

    final Map<String, IconData> typeIcons = {
      '交通': Icons.directions_transit,
      '住宿': Icons.hotel,
      '美食': Icons.restaurant,
      '景点': Icons.place,
      '购物': Icons.shopping_bag,
      '活动': Icons.celebration,
      '其他': Icons.more_horiz,
    };

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: bills.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = bills[index];
        return Card(
          child: ListTile(
            leading: Icon(typeIcons[item['type']] ?? Icons.receipt, color: Colors.blue),
            title: Text(item['desc'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${item['type']} · ${item['date']}'),
            trailing: Text('￥${item['amount'].toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: Colors.red)),
          ),
        );
      },
    );
  }
} 
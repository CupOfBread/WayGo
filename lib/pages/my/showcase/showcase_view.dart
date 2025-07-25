import 'package:flutter/material.dart';

class ShowcasePage extends StatelessWidget {
  ShowcasePage({Key? key}) : super(key: key);

  final exhibits = const [
    {'name': '地球仪', 'icon': Icons.public},
    {'name': '相机', 'icon': Icons.camera_alt},
    {'name': '背包', 'icon': Icons.backpack},
    {'name': '邮票', 'icon': Icons.local_post_office},
    {'name': '徽章', 'icon': Icons.emoji_events},
    {'name': '钥匙扣', 'icon': Icons.vpn_key},
    {'name': '纪念币', 'icon': Icons.monetization_on},
    {'name': '玩偶', 'icon': Icons.toys},
    {'name': '明信片', 'icon': Icons.mail},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          '我的展示柜',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: GridView.builder(
          itemCount: exhibits.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 24,
            crossAxisSpacing: 18,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, i) {
            final item = exhibits[i];
            return _SimpleShowcaseItem(
              icon: item['icon'] as IconData,
              name: item['name'] as String,
            );
          },
        ),
      ),
    );
  }
}

class _SimpleShowcaseItem extends StatelessWidget {
  final IconData icon;
  final String name;
  const _SimpleShowcaseItem({required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          child: Icon(icon, size: 32, color: Colors.blueGrey[700]),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
} 
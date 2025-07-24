import 'package:flutter/material.dart';

class ShowcasePage extends StatelessWidget {
  ShowcasePage({Key? key}) : super(key: key);

  final exhibits = const [
    {'name': '迷你地球仪', 'icon': Icons.public},
    {'name': '复古相机', 'icon': Icons.camera_alt},
    {'name': '旅行背包', 'icon': Icons.backpack},
    {'name': '纪念邮票', 'icon': Icons.local_post_office},
    {'name': '音乐盒', 'icon': Icons.music_note},
    {'name': '手工明信片', 'icon': Icons.mail},
    {'name': '冰箱贴', 'icon': Icons.kitchen},
    {'name': '玩偶', 'icon': Icons.toys},
    {'name': '徽章', 'icon': Icons.emoji_events},
    {'name': '钥匙扣', 'icon': Icons.vpn_key},
    {'name': '纪念币', 'icon': Icons.monetization_on},
    {'name': '小风扇', 'icon': Icons.toys},
    {'name': '手表', 'icon': Icons.watch},
    {'name': '小汽车', 'icon': Icons.directions_car},
    {'name': '小飞机', 'icon': Icons.flight},
    {'name': '小熊玩偶', 'icon': Icons.pets},
    {'name': '明信片', 'icon': Icons.post_add},
    {'name': '小书本', 'icon': Icons.menu_book},
    {'name': '纪念章', 'icon': Icons.stars},
    {'name': '小灯泡', 'icon': Icons.lightbulb},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFFB8860B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: const Text(
            '我的展示柜',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(color: Colors.black38, offset: Offset(2, 2), blurRadius: 4),
                Shadow(color: Colors.white, offset: Offset(-2, -2), blurRadius: 2),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 背景：深色木纹+玻璃反光
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6B4F27), Color(0xFFBCA177), Color(0xFFEAD7B2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CustomPaint(
              painter: _WoodGrainPainter(),
              child: Container(),
            ),
          ),
          // 玻璃柜体（纵向网格）
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha((0.18 * 255).toInt()),
                borderRadius: BorderRadius.circular(36),
                border: Border.all(color: Color(0xFFD2B48C), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((0.10 * 255).toInt()),
                    blurRadius: 32,
                    offset: Offset(0, 16),
                  ),
                ],
              ),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: exhibits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 28,
                  crossAxisSpacing: 18,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, i) {
                  final item = exhibits[i];
                  return _ShowcaseGlassItem(
                    icon: item['icon'] as IconData,
                    name: item['name'] as String,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseGlassItem extends StatelessWidget {
  final IconData icon;
  final String name;
  const _ShowcaseGlassItem({required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 灯光
        Positioned(
          top: 0,
          child: Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.white.withAlpha((0.35 * 255).toInt()), Colors.transparent],
                radius: 0.7,
                center: Alignment.topCenter,
              ),
            ),
          ),
        ),
        // 立体底座
        Positioned(
          bottom: 14,
          child: Container(
            width: 40,
            height: 12,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFD2B48C), Color(0xFF8B5C2A)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.18 * 255).toInt()),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        // 投影
        Positioned(
          bottom: 6,
          child: Container(
            width: 32,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha((0.10 * 255).toInt()),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
        // 玻璃格子
        Container(
          width: 70,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.38 * 255).toInt()),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Color(0xFFD2B48C), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withAlpha((0.10 * 255).toInt()),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Color(0xFF8B5C2A)),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B5C2A),
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 木纹Painter（简单模拟）
class _WoodGrainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFBCA177).withAlpha((0.12 * 255).toInt())
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    for (double y = 0; y < size.height; y += 32) {
      canvas.drawArc(
        Rect.fromLTWH(-40, y, size.width + 80, 48),
        0.1, 3.0, false, paint,
      );
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 
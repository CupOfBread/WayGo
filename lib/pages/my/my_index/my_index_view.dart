import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_index_logic.dart';
import '../stamp_collection/stamp_collection_view.dart';
import '../ticket_album/ticket_album_view.dart';
import '../../login/login_view.dart';
import '../my_footprint/my_footprint_view.dart';
import '../about/about_view.dart';

class MyIndexPage extends StatelessWidget {
  MyIndexPage({Key? key}) : super(key: key);

  final MyIndexLogic logic = Get.put(MyIndexLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: ListView(
        children: [
          SizedBox(height: 36),
          // 顶部头像和昵称信息居中悬浮卡片
          Center(
            child: Container(
              width: 340,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  SizedBox(height: 16),
                  const Text(
                    'taoban11',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  const Text(
                    '这个人很懒，什么都没有写',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // 功能列表卡片
          Center(
            child: Container(
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Column(
                  children: [
                    _MyListTile(
                      icon: Icons.travel_explore,
                      iconColor: Color(0xFF1976D2),
                      title: '我的足迹',
                      onTap: () => Get.to(() => const MyFootprintPage()),
                    ),
                    _MyDivider(),
                    _MyListTile(
                      icon: Icons.collections_bookmark,
                      iconColor: Color(0xFF1976D2),
                      title: '我的集章',
                      onTap: () => Get.to(() => const StampCollectionPage()),
                    ),
                    _MyDivider(),
                    _MyListTile(
                      icon: Icons.confirmation_num,
                      iconColor: Color(0xFF1976D2),
                      title: '票根纪念册',
                      onTap: () => Get.to(() => TicketAlbumPage()),
                    ),
                    _MyDivider(),
                    _MyListTile(
                      icon: Icons.info_outline,
                      iconColor: Color(0xFF1976D2),
                      title: '关于',
                      onTap: () => Get.to(() => const AboutPage()),
                    ),
                    _MyDivider(),
                    _MyListTile(
                      icon: Icons.exit_to_app,
                      iconColor: Colors.redAccent,
                      title: '退出登录',
                      onTap: () => Get.offAll(() => LoginPage()),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

// 新增自定义分隔线和列表项组件
class _MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Divider(height: 1, color: Color(0xFFF0F1F5)),
    );
  }
}

class _MyListTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const _MyListTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(8),
        child: Icon(icon, color: iconColor, size: 28),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

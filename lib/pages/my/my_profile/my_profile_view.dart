import 'package:flutter/material.dart';
import 'my_profile_logic.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = MyProfileLogic();
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人主页'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // 编辑功能待实现
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('编辑功能待开发')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const CircleAvatar(
              radius: 54,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            const SizedBox(height: 18),
            const Text(
              'taoban11',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '这个人很懒，什么都没有写',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.male, color: Colors.blue, size: 20),
                SizedBox(width: 6),
                Text('男', style: TextStyle(fontSize: 16)),
                SizedBox(width: 18),
                Icon(Icons.location_on, color: Colors.redAccent, size: 20),
                SizedBox(width: 6),
                Text('中国·杭州', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 32),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('个人简介', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('热爱旅行、美食、摄影，喜欢探索世界的每一个角落。', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Text('WayGo · 个人主页', style: TextStyle(fontSize: 15, color: Colors.black54)),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
} 
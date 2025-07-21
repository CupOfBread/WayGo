import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_index_logic.dart';
import '../stamp_collection/stamp_collection_view.dart';
import '../ticket_album/ticket_album_view.dart';
import '../../login/login_view.dart';

class MyIndexPage extends StatelessWidget {
  MyIndexPage({Key? key}) : super(key: key);

  final MyIndexLogic logic = Get.put(MyIndexLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('taoban11', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('这个人很懒，什么都没有写', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.collections_bookmark),
            title: Text('我的集章'),
            onTap: () {
              Get.to(() => const StampCollectionPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.confirmation_num),
            title: Text('票根纪念册'),
            onTap: () {
              Get.to(() => const TicketAlbumPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('退出登录'),
            onTap: () {
              Get.offAll(() => LoginPage());
            },
          ),
        ],
      ),
    );
  }
} 
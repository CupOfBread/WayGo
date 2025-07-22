import 'package:flutter/material.dart';

class StoreDetailPage extends StatelessWidget {
  const StoreDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 示例数据：可后续参数化
    const store = {
      'name': '熊猫咖啡',
      'desc': '成都最火的熊猫主题咖啡馆，打卡必去！店内有超多熊猫元素，适合拍照和聚会。',
      'image': 'https://cdn.pixabay.com/photo/2016/03/04/22/54/animal-1236875_1280.jpg',
      'tags': ['咖啡', '萌宠', '网红'],
      'address': '成都市锦江区春熙路88号',
      'open': '10:00 - 22:00',
      'recommend': '熊猫拉花咖啡、熊猫造型蛋糕、主题拍照区',
      'hot': true,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('网红店详情'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                store['image'] as String,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        store['name'] as String,
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      if (store['hot'] == true)
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('热门', style: TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    store['desc'] as String,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    children: List.generate(
                      (store['tags'] as List).length,
                      (i) => Chip(
                        label: Text((store['tags'] as List<String>)[i]),
                        backgroundColor: Colors.orange.shade50,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.redAccent, size: 22),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          store['address'] as String,
                          style: const TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue, size: 20),
                      const SizedBox(width: 6),
                      Text('营业时间：${store['open'] as String}', style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('推荐理由', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(store['recommend'] as String, style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SpotDetailPage extends StatelessWidget {
  const SpotDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'https://cdn.pixabay.com/photo/2025/07/12/10/04/reinebringen-9710168_1280.jpg',
      'https://cdn.pixabay.com/photo/2025/05/17/21/39/mountains-9606525_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/01/14/19/17/plane-8508636_1280.jpg',
    ];
    final PageController _pageController = PageController();
    final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('景点详情'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            '人民公园',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 2),
                    Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('公园广场·公园', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 18),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imageList.map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(item, fit: BoxFit.cover, width: double.infinity),
            )).toList(),
          ),
          const SizedBox(height: 24),
          const Text('为你介绍此地', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text(
            '人民公园位于成都市中心，是成都市最具代表性的城市公园之一。园内环境优美，绿树成荫，湖泊与花卉相映成趣，是市民休闲、散步、品茶的好去处。',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('精选评价', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildReview('环境优美，适合散步', '小明', 5),
          _buildReview('茶馆很有成都特色', '小红', 4),
          _buildReview('周末人有点多', '小刚', 4),
          const SizedBox(height: 24),
          const Text('营业信息', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.access_time, '营业时间', '06:00-22:00'),
          _buildInfoRow(Icons.location_on, '地址', '四川省成都市青羊区少城路12号'),
          _buildInfoRow(Icons.phone, '电话', '028-12345678'),
        ],
      ),
    );
  }

  Widget _buildReview(String content, String user, int star) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            child: Text(user[0]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Row(
                      children: List.generate(5, (i) => Icon(
                        i < star ? Icons.star : Icons.star_border,
                        color: Colors.orange,
                        size: 16,
                      )),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(content),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey, size: 20),
          const SizedBox(width: 8),
          Text('$label：', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
} 
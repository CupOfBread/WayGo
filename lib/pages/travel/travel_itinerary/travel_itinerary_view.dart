import 'package:flutter/material.dart';

class TravelItineraryPage extends StatelessWidget {
  const TravelItineraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 示例数据
    final List<Map<String, dynamic>> itinerary = [
      {'type': 'place', 'title': '春熙路', 'desc': '集合出发，成都市中心地标', 'image': null},
      {'type': 'traffic', 'mode': '自驾', 'desc': '约30分钟'},
      {'type': 'place', 'title': '宽窄巷子', 'desc': '午餐+闲逛，感受老成都风情', 'image': null},
      {'type': 'traffic', 'mode': '地铁', 'desc': '2号线直达春熙路'},
      {'type': 'place', 'title': '春熙路', 'desc': '购物、拍照', 'image': null},
      {'type': 'hotel', 'title': '成都中心假日酒店', 'desc': '休息一晚'},
      {'type': 'note', 'title': '小贴士', 'desc': '记得带伞，夏季多雨。', 'image': null},
      // 新增内容
      {'type': 'place', 'title': '都江堰景区', 'desc': '世界文化遗产，感受古代水利工程', 'image': null},
      {'type': 'traffic', 'mode': '高铁', 'desc': '成都东站出发，约40分钟'},
      {'type': 'place', 'title': '青城山', 'desc': '道教名山，登山观景', 'image': null},
      {'type': 'hotel', 'title': '青城山下民宿', 'desc': '体验当地民宿风情'},
      {'type': 'traffic', 'mode': '包车', 'desc': '前往乐山大佛，约2小时'},
      {'type': 'place', 'title': '乐山大佛', 'desc': '世界最大石刻佛像，游船观景', 'image': null},
      {'type': 'note', 'title': '温馨提示', 'desc': '乐山大佛景区人多，建议提前预约门票。', 'image': null},
      {'type': 'traffic', 'mode': '大巴', 'desc': '返回成都市区，约2小时'},
      {'type': 'place', 'title': '锦里古街', 'desc': '品尝成都小吃，体验夜市氛围', 'image': null},
      {'type': 'hotel', 'title': '成都文殊院酒店', 'desc': '最后一晚，方便第二天返程'},
      {'type': 'note', 'title': '返程提醒', 'desc': '提前收拾好行李，预留充足时间前往机场。', 'image': null},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children:
            itinerary.map((item) {
              switch (item['type']) {
                case 'place':
                  return _buildPlace(item);
                case 'traffic':
                  return _buildTraffic(item);
                case 'hotel':
                  return _buildHotel(item);
                case 'note':
                  return _buildNote(item);
                default:
                  return const SizedBox.shrink();
              }
            }).toList(),
      ),
    );
  }

  Widget _buildPlace(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const Icon(Icons.place, color: Colors.orange),
        title: Text(item['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item['desc'] ?? ''),
        trailing:
            item['image'] != null
                ? Image.network(item['image'], width: 48, height: 48, fit: BoxFit.cover)
                : null,
      ),
    );
  }

  Widget _buildTraffic(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: Colors.grey[400], thickness: 1, endIndent: 12)),
          Icon(
            item['mode'] == '自驾' ? Icons.directions_car : Icons.directions_transit,
            color: Colors.blue,
            size: 32,
          ),
          const SizedBox(width: 12),
          Text(
            item['mode'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          if (item['desc'] != null) ...[
            const SizedBox(width: 10),
            Text(item['desc'], style: const TextStyle(color: Colors.grey, fontSize: 16)),
          ],
          Expanded(child: Divider(color: Colors.grey[400], thickness: 1, indent: 12)),
        ],
      ),
    );
  }

  Widget _buildHotel(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: const Color(0xFFF5F7FA),
      child: ListTile(
        leading: const Icon(Icons.hotel, color: Colors.green),
        title: Text(item['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item['desc'] ?? ''),
      ),
    );
  }

  Widget _buildNote(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: const Color(0xFFFFF8E1),
      child: ListTile(
        leading: const Icon(Icons.sticky_note_2, color: Colors.amber),
        title: Text(item['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item['desc'] ?? ''),
        trailing:
            item['image'] != null
                ? Image.network(item['image'], width: 48, height: 48, fit: BoxFit.cover)
                : null,
      ),
    );
  }
}

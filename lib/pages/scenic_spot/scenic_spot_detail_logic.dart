import 'package:get/get.dart';
import 'package:waygo/model/travel/scenic_spot.dart';
import 'scenic_spot_detail_state.dart';

class ScenicSpotDetailLogic extends GetxController {
  final ScenicSpotDetailState state = ScenicSpotDetailState();

  @override
  void onInit() {
    super.onInit();
    // 生成假数据
    state.spot.value = ScenicSpot(
      [
        'https://cdn.pixabay.com/photo/2025/07/12/10/04/reinebringen-9710168_1280.jpg',
        'https://cdn.pixabay.com/photo/2025/05/17/21/39/mountains-9606525_1280.jpg',
        'https://cdn.pixabay.com/photo/2024/01/14/19/17/plane-8508636_1280.jpg',
      ],
      '人民公园位于成都市中心，是成都市最具代表性的城市公园之一。园内环境优美，绿树成荫，湖泊与花卉相映成趣，是市民休闲、散步、品茶的好去处。',
      4.8,
      DateTime.now(),
      DateTime.now(),
      ScenicSpotExtInfo(
        1,
        '06:00-22:00',
        '四川省成都市青羊区少城路12号',
        '028-12345678',
      ),
      null,
      DateTime.now(),
      id: 1,
      code: 'RMGY',
      name: '人民公园',
    );
    state.reviews.value = [
      ['环境优美，适合散步', '小明', 5],
      ['茶馆很有成都特色', '小红', 4],
      ['周末人有点多', '小刚', 4],
    ];
  }
} 
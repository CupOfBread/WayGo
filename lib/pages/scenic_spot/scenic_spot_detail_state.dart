import 'package:get/get.dart';
import 'package:waygo/model/travel/scenic_spot.dart';

class ScenicSpotDetailState {
  Rx<ScenicSpot> spot =
      ScenicSpot(
        id: 0,
        code: '',
        name: '',
        score: null,
        scoreUpdateTime: null,
        picUrlList: [],
        description: '',
        extInfo: null,
        coordinate: null,
        createTime: DateTime.now(),
        updateTime: DateTime.now(),
      ).obs;
  RxList<List<dynamic>> reviews = <List<dynamic>>[].obs;
}

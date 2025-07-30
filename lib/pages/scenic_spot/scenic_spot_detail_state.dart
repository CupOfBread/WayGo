import 'package:get/get.dart';
import 'package:waygo/model/travel/scenic_spot.dart';

class ScenicSpotDetailState {
  Rx<ScenicSpot> spot =
      ScenicSpot(
        [],
        '',
        null,
        null,
        DateTime.now(),
        null,
        null,
        DateTime.now(),
        id: 0,
        code: '',
        name: '',
      ).obs;
  RxList<List<dynamic>> reviews = <List<dynamic>>[].obs;
}

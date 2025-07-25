import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:get/get.dart';

class MapState {
  MapState() {
    bmfUserLocation = BMFUserLocation(location: BMFLocation(coordinate: BMFCoordinate(0, 0)));
  }

  late BMFMapController mapController;
  final LocationFlutterPlugin myLocPlugin = LocationFlutterPlugin();
  late final BMFUserLocation bmfUserLocation;

  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxDouble altitude = 0.0.obs;
  final RxDouble pickedLatitude = 0.0.obs;
  final RxDouble pickedLongitude = 0.0.obs;
}

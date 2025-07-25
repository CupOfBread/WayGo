import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:get/get.dart';
import 'map_state.dart';

class MapLogic extends GetxController {
  final MapState state = MapState();

  BaiduLocationAndroidOption initAndroidOptions() {
    BaiduLocationAndroidOption options = BaiduLocationAndroidOption(
      // 定位模式，可选的模式有高精度、仅设备、仅网络。默认为高精度模式
      locationMode: BMFLocationMode.hightAccuracy,
      // 是否需要返回地址信息
      isNeedAddress: true,
      // 是否需要返回海拔高度信息
      isNeedAltitude: true,
      // 是否需要返回周边poi信息
      isNeedLocationPoiList: true,
      // 是否需要返回新版本rgc信息
      isNeedNewVersionRgc: true,
      // 是否需要返回位置描述信息
      isNeedLocationDescribe: true,
      // 是否使用gps
      openGps: true,
      // 可选，设置场景定位参数，包括签到场景、运动场景、出行场景
      locationPurpose: BMFLocationPurpose.sport,
      // 坐标系
      coordType: BMFLocationCoordType.bd09ll,
      // 设置发起定位请求的间隔，int类型，单位ms
      // 如果设置为0，则代表单次定位，即仅定位一次，默认为0
      scanspan: 3000,
    );
    return options;
  }

  BaiduLocationIOSOption initIOSOptions() {
    BaiduLocationIOSOption options = BaiduLocationIOSOption(
      // 坐标系
      coordType: BMFLocationCoordType.bd09ll,
      // 位置获取超时时间
      locationTimeout: 10,
      // 获取地址信息超时时间
      reGeocodeTimeout: 10,
      // 应用位置类型 默认为automotiveNavigation
      activityType: BMFActivityType.automotiveNavigation,
      // 设置预期精度参数 默认为best
      desiredAccuracy: BMFDesiredAccuracy.best,
      // 是否需要最新版本rgc数据
      isNeedNewVersionRgc: true,
      // 指定定位是否会被系统自动暂停
      pausesLocationUpdatesAutomatically: false,
      // 指定是否允许后台定位,
      // 允许的话是可以进行后台定位的，但需要项目
      // 配置允许后台定位，否则会报错，具体参考开发文档
      allowsBackgroundLocationUpdates: true,
      // 设定定位的最小更新距离
      distanceFilter: 10,
    );
    return options;
  }

  Future<void> startLocating() async {
    Map androidMap = initAndroidOptions().getMap();
    Map iosMap = initIOSOptions().getMap();
    state.myLocPlugin.setAgreePrivacy(true);
    state.myLocPlugin.updateHeadingCallback(
      callback: (BaiduHeading result) {
        state.bmfUserLocation.heading = BMFHeading(magneticHeading: result.magneticHeading);
        // state.bmfUserLocation.location?.course = result.headingAccuracy;
        // LogUtil.info(msg)
      },
    );
    state.myLocPlugin.seriesLocationCallback(
      callback: (BaiduLocation result) {
        state.latitude.value = result.latitude ?? 0.0;
        state.longitude.value = result.longitude ?? 0.0;
        state.altitude.value = result.altitude ?? 0.0;

        state.bmfUserLocation.location = BMFLocation(
          coordinate: BMFCoordinate(state.latitude.value, state.longitude.value),
        );

        state.mapController.updateLocationData(state.bmfUserLocation);
      },
    );
    await state.myLocPlugin.prepareLoc(androidMap, iosMap);
    await state.myLocPlugin.startLocation();
    await state.myLocPlugin.startUpdatingHeading();
  }

  @override
  void onClose() {
    state.myLocPlugin.stopLocation();
    state.myLocPlugin.stopUpdatingHeading();
    super.onClose();
  }
}

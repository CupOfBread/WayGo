import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:get/get.dart';
import 'map_state.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';

class MapLogic extends GetxController {
  final MapState state = MapState();

  static Future<Uint8List?> generateExampleMarkerBytes(
    BuildContext context,
    String line1,
    String line2, {
    double pixelRatio = 3.0,
  }) async {
    final GlobalKey repaintKey = GlobalKey();
    final widget = Material(
      type: MaterialType.transparency,
      child: Center(
        child: RepaintBoundary(
          key: repaintKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  line1,
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900),
                ),
                Text(line2, style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );

    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry entry = OverlayEntry(builder: (_) => widget);
    overlayState.insert(entry);

    // 等待渲染
    await Future.delayed(const Duration(milliseconds: 100));
    RenderRepaintBoundary? boundary =
        repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      entry.remove();
      return null;
    }
    ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    entry.remove();
    return byteData?.buffer.asUint8List();
  }

  /// 添加示例marker到地图
  Future<void> addExampleMarker(BuildContext context) async {
    final mark1Stream1 = await MapLogic.generateExampleMarkerBytes(context, "第一天", "3个地点");
    if (mark1Stream1 == null) return;
    BMFMarker marker1 = BMFMarker.iconData(
      position: BMFCoordinate(30.252625, 120.154250),
      iconData: mark1Stream1,
    );

    final mark1Stream2 = await MapLogic.generateExampleMarkerBytes(context, "逃班威龙", "11班！！！");
    if (mark1Stream2 == null) return;
    BMFMarker marker2 = BMFMarker.iconData(
      position: BMFCoordinate(30.197208, 120.093279),
      iconData: mark1Stream2,
    );

    state.mapController.addMarker(marker1);
    state.mapController.addMarker(marker2);
  }

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

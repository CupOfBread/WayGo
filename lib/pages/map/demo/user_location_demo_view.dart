import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

/// 基础地图状态类
class BMFBaseMapState<T extends StatefulWidget> extends State<T> {
  late BMFMapController myMapController;

  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(),
    );
  }

  /// 创建完成回调
  void onBMFMapCreated(BMFMapController controller) async {
    myMapController = controller;
    /// 地图加载回调
    myMapController.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成');
    });
  }

  /// 设置地图参数
  BMFMapOptions initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.917215, 116.380341),
      zoomLevel: 12,
    );
    return mapOptions;
  }

  /// 创建地图
  Container generateMap() {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: BMFMapWidget(
        onBMFMapCreated: onBMFMapCreated,
        mapOptions: initMapOptions(),
      ),
    );
  }

  /// 创建控制栏
  Widget generateControlBar() {
    throw UnimplementedError();
  }
}

/// 定位模式示例
class ShowUserLocationModePage extends StatefulWidget {
  const ShowUserLocationModePage({super.key});

  @override
  _ShowUserLocationModePageState createState() =>
      _ShowUserLocationModePageState();
}

class _ShowUserLocationModePageState
    extends BMFBaseMapState<ShowUserLocationModePage> {
  /// 定位模式状态
  bool _showUserLocaion = true;

  /// 我的位置
  BMFUserLocation? _userLocation;

  /// 定位模式
  BMFUserTrackingMode _userTrackingMode = BMFUserTrackingMode.None;

  final LocationFlutterPlugin _myLocPlugin = LocationFlutterPlugin();

  /// 创建完成回调
  @override
  void onBMFMapCreated(BMFMapController controller) {
    super.onBMFMapCreated(controller);

    /// 地图加载回调
    myMapController.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成');

      ///设置定位参数
      locationAction();

      ///启动定位
      _myLocPlugin.startLocation();
      if (_showUserLocaion) {
        myMapController.showUserLocation(true);
        myMapController.setUserTrackingMode(_userTrackingMode);
      }
    });

    /// 切换定位模式回调
    myMapController.setUserTrackingModeChangedCallback(
        callback: (BMFUserTrackingMode mode) {
      print(mode.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _myLocPlugin.stopLocation();
    _myLocPlugin.stopUpdatingHeading();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    ///接受定位回调
    _myLocPlugin.seriesLocationCallback(callback: (BaiduLocation result) {
      setState(() {
        updateUserLocation(result);
      });
    });
    _myLocPlugin.startUpdatingHeading();
    _myLocPlugin.updateHeadingCallback(callback: (BaiduHeading heading) {
      setState(() {
        updateUserHeading(heading);
      });
    });

    return  Scaffold(
        appBar: AppBar(
          title: const Text('定位图层示例'),
        ),
        body: Stack(children: <Widget>[generateMap(), generateControlBar()]),
      );
  }

  @override
  Container generateMap() {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: BMFMapWidget(
        onBMFMapCreated: (mapController) {
          onBMFMapCreated(mapController);
        },
        mapOptions: initMapOptions(),
      ),
    );
  }

  /// 设置地图参数
  @override
  BMFMapOptions initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.965, 116.404),
      zoomLevel: 12,
      mapPadding: BMFEdgeInsets(top: 0, left: 50, right: 50, bottom: 0),
    );
    return mapOptions;
  }

  @override
  Widget generateControlBar() {
    return Container(
        width: screenSize.width,
        height: 60,
        color: Color(int.parse('0xD91F2131')),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Radio(
                    value: BMFUserTrackingMode.None,
                    groupValue: this._userTrackingMode,
                    onChanged: (value) {
                      setUserLocationMode(value as BMFUserTrackingMode);
                    },
                  ),
                  Text(
                    "普通模式",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: BMFUserTrackingMode.Follow,
                  groupValue: this._userTrackingMode,
                  onChanged: (value) {
                    setUserLocationMode(value as BMFUserTrackingMode);
                  },
                ),
                Text(
                  "跟随模式",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: BMFUserTrackingMode.FollowWithHeading,
                  groupValue: _userTrackingMode,
                  onChanged: (value) {
                    setUserLocationMode(value as BMFUserTrackingMode);
                  },
                ),
                Text(
                  "罗盘模式",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ));
  }

  void setUserLocationMode(BMFUserTrackingMode userTrackingMode) {
    setState(() {
      this._userTrackingMode = userTrackingMode;
    });

    if (!_showUserLocaion) {
      return;
    }

    if (userTrackingMode != BMFUserTrackingMode.None) {
      _myLocPlugin.startUpdatingHeading();
    } else {
      _myLocPlugin.stopUpdatingHeading();
    }
    myMapController.setUserTrackingMode(userTrackingMode,
        enableDirection: true);
  }

  void updateUserHeading(BaiduHeading heading) {
    if (Platform.isAndroid) {
      //android需要通过course设置方向
      _userLocation!.location!.course = heading.trueHeading;
    }
    BMFUserLocation userLocation = BMFUserLocation(
      //将包含course的BMFLocation对象传值给BMFUserLocation
      location: _userLocation!.location,
      //下面均是iOS的参数，iOS通过heading设置方向
      heading: BMFHeading.fromMap(heading.getMap()),
      title: '我是title',
    );
    myMapController.updateLocationData(userLocation);
  }

  /// 更新位置
  void updateUserLocation(BaiduLocation result) {
    BMFCoordinate coordinate =
        BMFCoordinate(result.latitude!, result.longitude!);
    BMFLocation location = BMFLocation(
        coordinate: coordinate,
        altitude: result.altitude,
        course: result.course,
        accuracy: result.radius,
        horizontalAccuracy: result.horizontalAccuracy,
        verticalAccuracy: result.verticalAccuracy);
    BMFUserLocation userLocation = BMFUserLocation(
      location: location,
    );
    _userLocation = userLocation;
    myMapController.updateLocationData(_userLocation!);
  }

  void locationAction() async {
    /// 设置android端和ios端定位参数
    /// android 端设置定位参数
    /// ios 端设置定位参数
    Map iosMap = _initIOSOptions().getMap();
    Map androidMap = _initAndroidOptions().getMap();

    await _myLocPlugin.prepareLoc(androidMap, iosMap);
  }

  /// 设置地图参数
  BaiduLocationAndroidOption _initAndroidOptions() {
    BaiduLocationAndroidOption options = BaiduLocationAndroidOption(
        locationMode: BMFLocationMode.hightAccuracy,
        isNeedAddress: true,
        isNeedAltitude: true,
        isNeedLocationPoiList: true,
        isNeedNewVersionRgc: true,
        isNeedLocationDescribe: true,
        openGps: true,
        scanspan: 4000,
        coordType: BMFLocationCoordType.bd09ll);
    return options;
  }

  BaiduLocationIOSOption _initIOSOptions() {
    BaiduLocationIOSOption options = BaiduLocationIOSOption(
        coordType: BMFLocationCoordType.bd09ll,
        desiredAccuracy: BMFDesiredAccuracy.best,
        allowsBackgroundLocationUpdates: true,
        pausesLocationUpdatesAutomatically: false);
    return options;
  }
} 
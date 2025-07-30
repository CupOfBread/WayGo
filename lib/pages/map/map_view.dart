import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'map_logic.dart';
import 'map_state.dart';
import 'package:flutter/rendering.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapLogic logic = Get.put(MapLogic());
    final MapState state = Get.find<MapLogic>().state;

    logic.startLocating();

    final BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(30.256702, 120.120948),
      zoomLevel: 13,
      showZoomControl: false,
      showOperateLayer: false,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('地图页面')),
      body: Stack(
        children: [
          BMFTextureMapWidget(
            mapOptions: mapOptions,
            onBMFMapCreated: (controller) async {
              state.mapController = controller;
              state.mapController.showUserLocation(true);
              state.mapController.setMapDidLoadCallback(
                callback: () {
                  state.mapController.setCustomMapStyle('assets/map_style/concise_cyan.sty', 0);
                  state.mapController.setCustomMapStyleEnable(true);
                },
              );
              state.mapController.setMapOnLongClickCallback(
                callback: (BMFCoordinate coordinate) {
                  state.pickedLatitude.value = coordinate.latitude;
                  state.pickedLongitude.value = coordinate.longitude;
                },
              );
              // 调用logic中的方法添加marker
              logic.addExampleMarker(context);
            },
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Obx(() {
              final lat = state.latitude.value;
              final lng = state.longitude.value;
              final alt = state.altitude.value;
              return Card(
                color: Colors.white.withAlpha((0.9 * 255).toInt()),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '当前位置：${lat == 0.0 && lng == 0.0 ? '--' : '${lat.toStringAsFixed(6)}, ${lng.toStringAsFixed(6)}'}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '当前海拔：${alt == 0.0 ? '--' : '${alt.toStringAsFixed(2)} m'}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '选点坐标：'
                        '${state.pickedLatitude.value == 0.0 && state.pickedLongitude.value == 0.0 ? '--' : '${state.pickedLatitude.value.toStringAsFixed(6)}, ${state.pickedLongitude.value.toStringAsFixed(6)}'}',
                        style: const TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "点击右下角按钮1移动到当前位置，长按地图可以进行选点查看坐标。",
                        style: const TextStyle(fontSize: 12, color: Colors.black26),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                final location = state.bmfUserLocation.location;
                if (location != null) {
                  state.mapController.setCenterCoordinate(location.coordinate!, false);
                  state.mapController.setNewMapStatus(
                    mapStatus: BMFMapStatus(fLevel: 16, fRotation: 0),
                    animateDurationMs: 1000,
                  );
                }
              },
              child: const Icon(Icons.my_location),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {
                // 唤起百度地图：https://lbs.baidu.com/faq/api?title=webapi/uri/andriod
                launchUrlString(
                  "baidumap://map/direction?origin=name:我家|latlng:27.988699,120.692134&destination=name:你家|latlng:30.197208,120.093279&coord_type=bd09ll&mode=driving&sy=0&car_type=TIME",
                );
              },
              child: const Icon(Icons.map),
            ),
          ],
        ),
      ),
    );
  }
}

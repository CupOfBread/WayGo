import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:get/get.dart';
import '../../common/log_util.dart';
import 'map_logic.dart';
import 'map_state.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapLogic logic = Get.put(MapLogic());
    final MapState state = Get.find<MapLogic>().state;

    logic.startLocating();

    final BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(27.960713, 120.713238),
      zoomLevel: 12,
      showZoomControl: false,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('地图页面')),
      body: Stack(
        children: [
          BMFMapWidget(
            mapOptions: mapOptions,
            onBMFMapCreated: (controller) {
              controller.setMapDidLoadCallback(
                callback: () {
                  controller.setCustomMapStyle(
                    'assets/map_style/baidu_map_style_smoke_rain.sty',
                    0,
                  );
                  controller.setCustomMapStyleEnable(true);
                },
              );
            },
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Obx(() {
              final lat = logic.latitude.value;
              final lng = logic.longitude.value;
              final alt = logic.altitude.value;
              return Card(
                color: Colors.white.withOpacity(0.9),
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
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 定位逻辑待实现
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}

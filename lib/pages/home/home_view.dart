import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_logic.dart';
import 'home_state.dart';
import '../map/map_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('home'),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const MapPage());
                },
                child: Text('进入地图页面'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

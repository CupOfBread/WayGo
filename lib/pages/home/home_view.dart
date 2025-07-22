import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_logic.dart';
import 'home_state.dart';
import '../map/map_view.dart';
import '../travel/travel_view.dart';
import '../spot/spot_detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildHomeCard(
                      icon: Icons.card_travel,
                      text: '旅行',
                      color1: Color(0xFFFFA726),
                      color2: Color(0xFFFF7043),
                      boxShadowColor: Colors.orange,
                      onTap: () {
                        Get.to(() => DefaultTabController(
                              length: 3,
                              child: TravelPage(),
                            ));
                      },
                    ),
                    _buildHomeCard(
                      icon: Icons.map,
                      text: '地图',
                      color1: Color(0xFF42A5F5),
                      color2: Color(0xFF1976D2),
                      boxShadowColor: Colors.blue,
                      onTap: () {
                        Get.to(() => const MapPage());
                      },
                    ),
                    _buildHomeCard(
                      icon: Icons.park,
                      text: '景点详情',
                      color1: Color(0xFF66BB6A),
                      color2: Color(0xFF43A047),
                      boxShadowColor: Colors.green,
                      onTap: () {
                        Get.to(() => const SpotDetailPage());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHomeCard({
  required IconData icon,
  required String text,
  required Color color1,
  required Color color2,
  required Color boxShadowColor,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 140,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: Colors.white),
          SizedBox(height: 12),
          Text(text, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

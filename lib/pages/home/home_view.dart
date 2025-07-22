import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/store/store_detail/store_detail_view.dart';
import '../store/store_list_view.dart';
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
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.start,
                      children: [
                        _buildHomeCard(
                          icon: Icons.card_travel,
                          text: '旅程详情',
                          color1: Color(0xFFFFA726),
                          color2: Color(0xFFFF7043),
                          boxShadowColor: Colors.orange,
                          onTap: () {
                            Get.to(
                              () => DefaultTabController(
                                length: 3,
                                child: TravelPage(),
                              ),
                            );
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
                    const SizedBox(height: 24),
                    Container(
                      width: 340,
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.start,
                      children: [
                        _buildHomeCard(
                          icon: Icons.storefront,
                          text: '店铺详情',
                          color1: Color(0xFFEC407A),
                          color2: Color(0xFFAB47BC),
                          boxShadowColor: Colors.purple,
                          onTap: () {
                            Get.to(() => const StoreDetailPage());
                          },
                        ),
                        _buildHomeCard(
                          icon: Icons.view_module,
                          text: '店铺列表',
                          color1: Color(0xFF6a85b6),
                          color2: Color(0xFFbac8e0),
                          boxShadowColor: Colors.blueGrey,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const StoreListPage()),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: 340,
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.start,
                      children: [
                        _buildHomeCard(
                          icon: Icons.login,
                          text: '登录页',
                          color1: Color(0xFF43cea2),
                          color2: Color(0xFF185a9d),
                          boxShadowColor: Colors.teal,
                          onTap: () {
                            Get.toNamed('/login');
                          },
                        ),
                        _buildHomeCard(
                          icon: Icons.radio,
                          text: '收音机',
                          color1: Color(0xFFffb347),
                          color2: Color(0xFFffcc33),
                          boxShadowColor: Colors.orangeAccent,
                          onTap: () {
                            Get.toNamed('/radio');
                          },
                        ),
                      ],
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
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

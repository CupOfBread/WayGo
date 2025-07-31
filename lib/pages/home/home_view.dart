import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/store/store_detail/store_detail_view.dart';
import 'package:waygo/pages/store/store_list_view.dart';
import '../map/demo/user_location_demo_view.dart';
import '../scenic_spot/scenic_spot_detail_view.dart';
import '../travel/travel_list/travel_list_view.dart';
import 'home_logic.dart';
import 'home_state.dart';
import 'package:waygo/pages/map/map_view.dart';
import 'package:waygo/pages/travel/travel_detail/travel_detail_view.dart';
import 'package:waygo/pages/account/account_list/account_list_view.dart';
import 'package:waygo/pages/account/account_detail/account_detail_view.dart' as detail_view;
import 'package:waygo/pages/account/account_record/account_record_view.dart' as record_view;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    double cardWidth = ((MediaQuery.of(context).size.width - 64) / 3).clamp(80.0, 999.0);
    final List<_HomeCardData> group1 = [
      _HomeCardData(
        icon: Icons.list_alt,
        text: '旅程列表',
        onTap: () {
          Get.to(() => const TravelListPage());
        },
      ),
      _HomeCardData(
        icon: Icons.card_travel,
        text: '旅程详情',
        onTap: () {
          Get.to(() => DefaultTabController(length: 3, child: TravelPage(travelPlanId: 1)));
        },
      ),
      _HomeCardData(
        icon: Icons.map,
        text: '地图',
        onTap: () {
          Get.to(() => const MapPage());
        },
      ),
      _HomeCardData(
        icon: Icons.park,
        text: '景点详情',
        onTap: () {
          Get.to(() => const ScenicSpotDetailPage());
        },
      ),
      _HomeCardData(
        icon: Icons.my_location,
        text: '百度地图官方示例',
        onTap: () {
          Get.to(() => ShowUserLocationModePage());
        },
      ),
    ];
    final List<_HomeCardData> group2 = [
      _HomeCardData(
        icon: Icons.storefront,
        text: '店铺详情',
        onTap: () {
          Get.to(() => const StoreDetailPage());
        },
      ),
      _HomeCardData(
        icon: Icons.view_module,
        text: '店铺列表',
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const StoreListPage()));
        },
      ),
    ];
    final List<_HomeCardData> group3 = [
      _HomeCardData(
        icon: Icons.login,
        text: '登录页',
        onTap: () {
          Get.toNamed('/login');
        },
      ),
      _HomeCardData(
        icon: Icons.radio,
        text: '收音机',
        onTap: () {
          Get.toNamed('/radio');
        },
      ),
    ];
    final List<_HomeCardData> group4 = [
      _HomeCardData(
        icon: Icons.book,
        text: '账本列表',
        onTap: () {
          Get.to(() => const AccountListPage());
        },
      ),
      _HomeCardData(
        icon: Icons.description,
        text: '账本详情',
        onTap: () {
          Get.to(() => const detail_view.AccountDetailPage());
        },
      ),
      _HomeCardData(
        icon: Icons.edit,
        text: '记一笔',
        onTap: () {
          Get.to(() => const record_view.AccountRecordPage());
        },
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0, bottom: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                        child: Text(
                          '旅程功能',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      _buildCardGroup(group1, cardWidth, isJourneyGroup: true),
                      const SizedBox(height: 24),
                      Container(width: 340, child: Divider(color: Color(0xFFE0E0E0), thickness: 1)),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                        child: Text(
                          '记账功能',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      _buildCardGroup(group4, cardWidth, isAccountGroup: true),
                      const SizedBox(height: 24),
                      Container(width: 340, child: Divider(color: Color(0xFFE0E0E0), thickness: 1)),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                        child: Text(
                          '店铺功能',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      _buildCardGroup(group2, cardWidth, isShopGroup: true),
                      const SizedBox(height: 24),
                      Container(width: 340, child: Divider(color: Color(0xFFE0E0E0), thickness: 1)),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                        child: Text(
                          '其他功能',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      _buildCardGroup(group3, cardWidth, isOtherGroup: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCardGroup(
  List<_HomeCardData> cards,
  double cardWidth, {
  bool isJourneyGroup = false,
  bool isAccountGroup = false,
  bool isShopGroup = false,
  bool isOtherGroup = false,
}) {
  return GridView.count(
    crossAxisCount: 3,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    mainAxisSpacing: 16,
    crossAxisSpacing: 12,
    childAspectRatio: cardWidth / 100,
    children:
        cards
            .map(
              (card) => _buildHomeCard(
                width: cardWidth,
                icon: card.icon,
                text: card.text,
                onTap: card.onTap,
                gradient:
                    isJourneyGroup
                        ? LinearGradient(
                          colors: [Color(0xFFC471F5), Color(0xFFFA71CD)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: GradientRotation(45 * 3.1415926 / 180),
                        )
                        : isAccountGroup
                        ? LinearGradient(
                          colors: [
                            Color(0xFFF78CA0),
                            Color(0xFFF9748F),
                            Color(0xFFFD868C),
                            Color(0xFFFE9A8B),
                          ],
                          stops: [0.0, 0.19, 0.6, 1.0],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: GradientRotation(45 * 3.1415926 / 180),
                        )
                        : isShopGroup
                        ? LinearGradient(
                          colors: [Color(0xFF64B3F4), Color(0xFFC2E59C)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: GradientRotation(45 * 3.1415926 / 180),
                        )
                        : isOtherGroup
                        ? LinearGradient(
                          colors: [Color(0xFF6E45E2), Color(0xFF88D3CE)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: GradientRotation(45 * 3.1415926 / 180),
                        )
                        : null,
                fontColor:
                    (isJourneyGroup || isAccountGroup || isShopGroup || isOtherGroup)
                        ? Colors.white
                        : Colors.black87,
                iconColor:
                    (isJourneyGroup || isAccountGroup || isShopGroup || isOtherGroup)
                        ? Colors.white
                        : Colors.black87,
                boxShadow:
                    isJourneyGroup
                        ? [
                          BoxShadow(
                            color: Color(0xFFB04BEA).withValues(alpha: 0.25),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                          BoxShadow(
                            color: Color(0xFFFA71CD).withValues(alpha: 0.12),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                        : isAccountGroup
                        ? [
                          BoxShadow(
                            color: Color(0xFFF9748F).withValues(alpha: 0.18),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                          BoxShadow(
                            color: Color(0xFFFD868C).withValues(alpha: 0.10),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                        : isShopGroup
                        ? [
                          BoxShadow(
                            color: Color(0xFF64B3F4).withValues(alpha: 0.18),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                          BoxShadow(
                            color: Color(0xFFC2E59C).withValues(alpha: 0.10),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                        : isOtherGroup
                        ? [
                          BoxShadow(
                            color: Color(0xFF6E45E2).withValues(alpha: 0.18),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                          BoxShadow(
                            color: Color(0xFF88D3CE).withValues(alpha: 0.10),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                        : null,
              ),
            )
            .toList(),
  );
}

class _HomeCardData {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  _HomeCardData({required this.icon, required this.text, required this.onTap});
}

Widget _buildHomeCard({
  required double width,
  required IconData icon,
  required String text,
  required VoidCallback onTap,
  Gradient? gradient,
  Color fontColor = Colors.black87,
  Color iconColor = Colors.black87,
  List<BoxShadow>? boxShadow,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: gradient == null ? Colors.white : null,
        gradient: gradient,
        boxShadow: boxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: iconColor),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: fontColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

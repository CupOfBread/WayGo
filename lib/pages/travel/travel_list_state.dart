import 'travel_list_view.dart';

class TravelListState {
  List<TravelInfo> travels = [
    TravelInfo(
      title: '赛博8D成都3天2晚热辣滚烫之旅',
      departureDate: '2025.7.23',
      members: 2,
      duration: '3天2晚',
      distance: '49.26',
    ),
    TravelInfo(
      title: '川西环线5天4晚自驾之旅',
      departureDate: '2025.8.10',
      members: 4,
      duration: '5天4晚',
      distance: '320.5',
    ),
    TravelInfo(
      title: '重庆火锅美食2日游',
      departureDate: '2025.9.01',
      members: 3,
      duration: '2天1晚',
      distance: '18.7',
    ),
    TravelInfo(
      title: '云南大理丽江6天5晚深度游',
      departureDate: '2025.10.15',
      members: 5,
      duration: '6天5晚',
      distance: '680.0',
    ),
    TravelInfo(
      title: '厦门鼓浪屿亲子3日游',
      departureDate: '2025.11.05',
      members: 3,
      duration: '3天2晚',
      distance: '12.3',
    ),
    TravelInfo(
      title: '新疆伊犁草原10天9晚摄影之旅',
      departureDate: '2026.6.20',
      members: 6,
      duration: '10天9晚',
      distance: '1200.8',
    ),
  ];
  TravelListState() {
    // 初始化变量
  }
} 
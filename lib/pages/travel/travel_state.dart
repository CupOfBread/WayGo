import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TravelState {
  TabController? tabController;
  List<String> tabs = ['行程', '账单', '行李'];
  RxInt tabIndex = 0.obs;
  TravelState() {
    /// 初始化变量
  }
} 
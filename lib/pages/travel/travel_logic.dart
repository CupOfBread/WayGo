import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'travel_state.dart';

class TravelLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final TravelState state = TravelState();

  @override
  void onInit() {
    super.onInit();
    state.tabController = TabController(length: state.tabs.length, vsync: this);
    state.tabController!.addListener(() {
      if (!state.tabController!.indexIsChanging) {
        state.tabIndex.value = state.tabController!.index;
      }
    });
  }

  @override
  void onClose() {
    state.tabController?.dispose();
    super.onClose();
  }
} 
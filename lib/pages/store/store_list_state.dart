import 'package:flutter/material.dart';

class StoreListState {
  /// 店铺数据列表
  List<StoreItem> storeList;

  /// 是否正在加载
  bool isLoading;

  StoreListState({
    this.storeList = const [],
    this.isLoading = false,
  });
}

class StoreItem {
  final String id;
  final String name;
  final String imageUrl;
  final String? description;
  final String userAvatarUrl;
  final String userName;
  final int likeCount;

  StoreItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description,
    required this.userAvatarUrl,
    required this.userName,
    required this.likeCount,
  });
} 
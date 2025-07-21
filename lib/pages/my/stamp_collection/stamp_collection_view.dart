import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stamp_collection_logic.dart';

class StampCollectionPage extends StatelessWidget {
  const StampCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StampCollectionLogic());
    return Scaffold(
      appBar: AppBar(title: const Text('我的集章')),
      body: const Center(
        child: Text('集章页面'),
      ),
    );
  }
}

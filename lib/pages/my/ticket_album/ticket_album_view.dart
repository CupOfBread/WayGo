import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ticket_album_logic.dart';

class TicketAlbumPage extends StatelessWidget {
  const TicketAlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TicketAlbumLogic());
    return Scaffold(
      appBar: AppBar(title: const Text('票根纪念册')),
      body: const Center(
        child: Text('票根纪念册页面'),
      ),
    );
  }
}

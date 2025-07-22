import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/my/ticket_album/ticket_detail/ticket_detail_page.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/boarding_pass.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/movie_ticket.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/show_ticket.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/train_ticket.dart';
import 'ticket_album_logic.dart';

class TicketAlbumPage extends StatefulWidget {
  const TicketAlbumPage({super.key});

  @override
  State<TicketAlbumPage> createState() => _TicketAlbumPageState();
}

class _TicketAlbumPageState extends State<TicketAlbumPage> {
  late int _movieTicketCount;
  late int _showTicketCount;
  late int _trainTicketCount;
  late int _boardingPassCount;

  @override
  void initState() {
    super.initState();
    final random = Random();
    _movieTicketCount = random.nextInt(3) + 2;
    _showTicketCount = random.nextInt(3) + 2;
    _trainTicketCount = random.nextInt(3) + 2;
    _boardingPassCount = random.nextInt(3) + 2;
    Get.put(TicketAlbumLogic());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('票根纪念册'),
          bottom: const TabBar(
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            indicatorColor: Color.fromRGBO(255, 81, 4, 1),
            labelColor: Color.fromRGBO(255, 81, 4, 1),
            unselectedLabelColor: Colors.black87,
            tabs: [
              Tab(text: '电影'),
              Tab(text: '演出'),
              Tab(text: '火车票'),
              Tab(text: '登机牌'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTicketList(
              _movieTicketCount,
              (context, index) => const MovieTicket(),
              isClickable: true,
              detailItemBuilder: (index) => const MovieTicket(),
            ),
            _buildTicketList(
              _showTicketCount,
              (context, index) => const ShowTicket(),
              isClickable: true,
              detailItemBuilder: (index) => const ShowTicket(),
            ),
            _buildTicketList(
              _trainTicketCount,
              (context, index) => const TrainTicket(),
            ),
            _buildTicketList(
              _boardingPassCount,
              (context, index) => const BoardingPass(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketList(
    int count,
    Widget Function(BuildContext, int) itemBuilder, {
    bool isClickable = false,
    Widget Function(int index)? detailItemBuilder,
  }) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: GestureDetector(
              onTap:
                  isClickable
                      ? () {
                        Get.to(
                          () => TicketDetailPage(
                            initialIndex: index,
                            ticketCount: count,
                            ticketBuilder: (i) => detailItemBuilder!(i),
                          ),
                        );
                      }
                      : null,
              child: itemBuilder(context, index),
            ),
          ),
        );
      },
    );
  }
}

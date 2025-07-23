import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/my/ticket_album/ticket_detail/ticket_detail_view.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/boarding_pass.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/movie_ticket.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/show_ticket.dart';
import 'package:waygo/pages/my/ticket_album/ticket_widgets/train_ticket.dart';
import 'ticket_album_logic.dart';

class TicketAlbumPage extends StatelessWidget {
  TicketAlbumPage({super.key});

  final TicketAlbumLogic logic = Get.put(TicketAlbumLogic());

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
              logic.movieTicketCount,
              (context, index) => const MovieTicket(),
              isClickable: true,
              detailItemBuilder: (index) => const MovieTicket(),
            ),
            _buildTicketList(
              logic.showTicketCount,
              (context, index) => const ShowTicket(),
              isClickable: true,
              detailItemBuilder: (index) => const ShowTicket(),
            ),
            _buildTicketList(
              logic.trainTicketCount,
              (context, index) => const TrainTicket(),
            ),
            _buildTicketList(
              logic.boardingPassCount,
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

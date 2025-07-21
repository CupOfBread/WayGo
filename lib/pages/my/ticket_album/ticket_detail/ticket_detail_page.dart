import 'package:flutter/material.dart';

class TicketDetailPage extends StatefulWidget {
  final int initialIndex;
  final int ticketCount;
  final Widget Function(int index) ticketBuilder;

  const TicketDetailPage({
    super.key,
    required this.initialIndex,
    required this.ticketCount,
    required this.ticketBuilder,
  });

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _pageController.addListener(() {
      if (_pageController.page?.round() != _currentIndex) {
        setState(() {
          _currentIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_currentIndex + 1} / ${widget.ticketCount}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 220,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.ticketCount,
                    itemBuilder: (context, index) {
                      return Center(
                        child: InteractiveViewer(
                          panEnabled: false,
                          minScale: 1.0,
                          maxScale: 3.0,
                          child: widget.ticketBuilder(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DetailButton(icon: Icons.camera_alt_outlined, label: '记录此刻'),
                _DetailButton(icon: Icons.edit_outlined, label: '编辑票面'),
                _DetailButton(icon: Icons.people_outline, label: '赠同行人'),
                _DetailButton(icon: Icons.copy_outlined, label: '复制票根'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black54, size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ],
    );
  }
} 
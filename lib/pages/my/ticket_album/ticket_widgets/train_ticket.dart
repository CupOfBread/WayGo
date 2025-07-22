import 'package:flutter/material.dart';

class TrainTicket extends StatelessWidget {
  const TrainTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Waygo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('北京', style: TextStyle(fontSize: 20)),
                      Icon(Icons.arrow_forward, color: Colors.grey),
                      Text('上海', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  const Text('2024-08-08 08:08', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey, style: BorderStyle.solid, width: 1.0),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('座位'),
                  Text('8A', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
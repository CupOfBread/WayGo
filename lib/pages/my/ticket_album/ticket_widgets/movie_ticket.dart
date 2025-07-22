import 'package:flutter/material.dart';

class MovieTicket extends StatelessWidget {
  const MovieTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E50),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '电影名称',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '万达影院 (CBD店)',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      _InfoChip(label: 'IMAX'),
                      SizedBox(width: 8),
                      _InfoChip(label: '3D'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF34495E),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('座位', style: TextStyle(color: Colors.white70)),
                  Text('8排12座', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('影厅', style: TextStyle(color: Colors.white70)),
                  Text('激光厅', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  const _InfoChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.amber,
      labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      padding: EdgeInsets.zero,
    );
  }
} 
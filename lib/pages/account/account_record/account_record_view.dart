import 'package:flutter/material.dart';

class AccountRecordPage extends StatelessWidget {
  const AccountRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        appBar: AppBar(
          title: const Text('记一笔'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '支出'),
              Tab(text: '收入'),
              Tab(text: '转账'),
              Tab(text: '余额'),
              Tab(text: '退款'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _RecordTabContent(type: '支出'),
            _RecordTabContent(type: '收入'),
            _RecordTabContent(type: '转账'),
            _RecordTabContent(type: '余额'),
            _RecordTabContent(type: '退款'),
          ],
        ),
      ),
    );
  }
}

class _RecordTabContent extends StatelessWidget {
  final String type;
  const _RecordTabContent({required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('类别：$type', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          TextField(
            decoration: const InputDecoration(
              labelText: '金额',
              prefixIcon: Icon(Icons.attach_money),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: const InputDecoration(
              labelText: '备注',
              prefixIcon: Icon(Icons.edit_note),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('保存'),
            ),
          ),
        ],
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/account/account_detail/account_detail_view.dart';
import 'package:waygo/model/account/account_book.dart';

class AccountListPage extends StatelessWidget {
  const AccountListPage({Key? key}) : super(key: key);

  // 本地生成5个账本数据
  List<AccountBook> get _accountBooks => [
        AccountBook(
          id: 1,
          ownerId: 1001,
          name: '生活账本',
          coverUrl: 'https://picsum.photos/seed/life/80',
          description: '记录日常生活收支',
          createTime: DateTime(2024, 1, 1),
        ),
        AccountBook(
          id: 2,
          ownerId: 1001,
          name: '旅行账本',
          coverUrl: 'https://picsum.photos/seed/travel/80',
          description: '记录旅行花费',
          createTime: DateTime(2023, 7, 15),
        ),
        AccountBook(
          id: 3,
          ownerId: 1001,
          name: '工作账本',
          coverUrl: 'https://picsum.photos/seed/work/80',
          description: '工作相关账目',
          createTime: DateTime(2022, 3, 10),
        ),
        AccountBook(
          id: 4,
          ownerId: 1001,
          name: '学习账本',
          coverUrl: 'https://picsum.photos/seed/study/80',
          description: '学习支出记录',
          createTime: DateTime(2021, 9, 1),
        ),
        AccountBook(
          id: 5,
          ownerId: 1001,
          name: '家庭账本',
          coverUrl: 'https://picsum.photos/seed/family/80',
          description: '家庭收支',
          createTime: DateTime(2020, 5, 20),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          '账本列表',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Color(0xFF666666),
            ),
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _accountBooks.length,
        itemBuilder: (context, index) {
          final book = _accountBooks[index];
          return Column(
            children: [
              _buildAccountBookCard(context, book),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: '新建账本',
      ),
    );
  }

  Widget _buildAccountBookCard(BuildContext context, AccountBook book) {
    final color = Colors.primaries[book.id % Colors.primaries.length];
    return GestureDetector(
      onTap: () {
        // 跳转到账本详情页面
        Get.to(() => const AccountDetailPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withAlpha((0.1 * 255).toInt()),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha((0.15 * 255).toInt()),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          children: [
            if (book.coverUrl != null && book.coverUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  book.coverUrl!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              )
            else
              Icon(Icons.book, color: color, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
                  if (book.description != null && book.description!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(book.description!, style: TextStyle(fontSize: 14, color: color.withAlpha((0.7 * 255).toInt()))),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    '创建时间：${book.createTime.year}-${book.createTime.month.toString().padLeft(2, '0')}-${book.createTime.day.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18)
          ],
        ),
      ),
    );
  }
} 
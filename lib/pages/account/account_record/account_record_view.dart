import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account_record_logic.dart';

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
    final logic = Get.put(AccountRecordLogic());
    final categories = ['景点', '餐饮', '住宿', '交通', '购物', '娱乐', '其他'];
    final amountController = TextEditingController();
    final remarkController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 分类选择（弹出框）
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('分类', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: Obx(() => GestureDetector(
                      onTap: () async {
                        final selected = await showDialog<String>(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: const Text('选择分类'),
                            children: categories
                                .map((e) => SimpleDialogOption(
                                      onPressed: () => Navigator.pop(context, e),
                                      child: Text(e),
                                    ))
                                .toList(),
                          ),
                        );
                        if (selected != null) logic.setCategory(selected);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(logic.category.value, style: const TextStyle(fontSize: 16)),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 金额输入框
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('金额', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                    hintText: '请输入金额',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 时间选择器
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('时间', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: Obx(() => GestureDetector(
                      onTap: () async {
                        final now = DateTime.now();
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(now),
                          );
                          if (pickedTime != null) {
                            final dt = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                            logic.setDateTime(dt.toString().substring(0, 19));
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(logic.dateTime.value, style: const TextStyle(fontSize: 16)),
                            const Icon(Icons.access_time),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 备注输入框
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('备注', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: TextField(
                  controller: remarkController,
                  decoration: const InputDecoration(
                    hintText: '请输入备注',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  ),
                ),
              ),
            ],
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
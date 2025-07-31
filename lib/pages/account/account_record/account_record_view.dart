import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account_record_logic.dart';
import 'package:flutter/services.dart';

class AccountRecordPage extends StatelessWidget {
  const AccountRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        appBar: AppBar(
          title: const Text(
            '记一笔',
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
        body: const _RecordContent(),
      ),
    );
  }
}

class _RecordContent extends StatelessWidget {
  const _RecordContent();

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AccountRecordLogic());
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 类型选择（弹窗，单选）
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('类型', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final logic = Get.find<AccountRecordLogic>();
                    final selected = await showDialog<int>(
                      context: context,
                      builder:
                          (context) => SimpleDialog(
                            title: const Text('选择类型'),
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ...logic.types.map(
                                    (e) => RadioListTile<int>(
                                      value: e.id,
                                      groupValue: logic.state.form.typeId.value,
                                      onChanged:
                                          (v) => Navigator.pop(context, v),
                                      title: Text(e.name),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    );
                    if (selected != null) logic.setTypeId(selected);
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            logic.types
                                    .firstWhereOrNull(
                                      (e) =>
                                          e.id == logic.state.form.typeId.value,
                                    )
                                    ?.name ??
                                '',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 分类选择（弹窗，单选）
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('分类', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final logic = Get.find<AccountRecordLogic>();
                    final selected = await showDialog<int>(
                      context: context,
                      builder:
                          (context) => SimpleDialog(
                            title: const Text('选择分类'),
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ...logic.categories.map(
                                    (e) => RadioListTile<int>(
                                      value: e.id,
                                      groupValue:
                                          logic.state.form.categoryId.value,
                                      onChanged:
                                          (v) => Navigator.pop(context, v),
                                      title: Text(e.name),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    );
                    if (selected != null) logic.setCategoryId(selected);
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            logic.categories
                                    .firstWhereOrNull(
                                      (e) =>
                                          e.id ==
                                          logic.state.form.categoryId.value,
                                    )
                                    ?.name ??
                                '',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
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
                child: Obx(() {
                  final controller = TextEditingController(
                    text: logic.state.form.amount.value,
                  );
                  controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length),
                  );
                  return TextField(
                    onChanged: logic.setAmount,
                    decoration: const InputDecoration(
                      hintText: '请输入金额',
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}'),
                      ),
                    ],
                    controller: controller,
                  );
                }),
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
                child: Obx(
                  () => GestureDetector(
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            logic.state.form.dateTime.value,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 付款人选择（弹窗，单选）
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('付款人', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final logic = Get.find<AccountRecordLogic>();
                    final selected = await showDialog<int>(
                      context: context,
                      builder:
                          (context) => SimpleDialog(
                            title: const Text('选择付款人'),
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ...logic.persons.map(
                                    (e) => RadioListTile<int>(
                                      value: e.id,
                                      groupValue:
                                          logic.state.form.payerId.value,
                                      onChanged:
                                          (v) => Navigator.pop(context, v),
                                      title: Text(e.name),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    );
                    if (selected != null) logic.setPayerId(selected);
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            logic.persons
                                    .firstWhereOrNull(
                                      (e) =>
                                          e.id ==
                                          logic.state.form.payerId.value,
                                    )
                                    ?.name ??
                                '',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 参与人选择（弹窗，多选）
          Row(
            children: [
              const SizedBox(
                width: 64,
                child: Text('参与人', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final logic = Get.find<AccountRecordLogic>();
                    final selected = await showDialog<List<int>>(
                      context: context,
                      builder: (context) {
                        final tempSelected = [
                          ...logic.state.form.participantIds,
                        ];
                        return StatefulBuilder(
                          builder:
                              (context, setState) => SimpleDialog(
                                title: const Text('选择参与人'),
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ...logic.persons.map(
                                        (e) => CheckboxListTile(
                                          value: tempSelected.contains(e.id),
                                          title: Text(e.name),
                                          onChanged: (checked) {
                                            setState(() {
                                              if (checked == true) {
                                                tempSelected.add(e.id);
                                              } else {
                                                tempSelected.remove(e.id);
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed:
                                              () => Navigator.pop(
                                                context,
                                                tempSelected,
                                              ),
                                          child: const Text('确定'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        );
                      },
                    );
                    if (selected != null) logic.setParticipantIds(selected);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Obx(
                            () => Text(
                              logic.state.form.participantIds.isEmpty
                                  ? '请选择参与人'
                                  : logic.persons
                                      .where(
                                        (e) => logic
                                            .state
                                            .form
                                            .participantIds
                                            .contains(e.id),
                                      )
                                      .map((e) => e.name)
                                      .join('、'),
                              style: const TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
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
                child: Obx(() {
                  final controller = TextEditingController(
                    text: logic.state.form.remark.value,
                  );
                  controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length),
                  );
                  return TextField(
                    onChanged: logic.setRemark,
                    decoration: const InputDecoration(
                      hintText: '备注',
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                    ),
                    controller: controller,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                logic.saveRecord();
              },
              child: const Text('保存'),
            ),
          ),
        ],
      ),
    );
  }
}

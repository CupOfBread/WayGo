class AccountBook {
  final int id;
  final String code;
  final String name;
  final String? coverUrl;
  final String? description;
  final DateTime createTime;

  AccountBook(
    this.code,
    this.coverUrl,
    this.description,
    this.createTime, {
    required this.id,
    required this.name,
  });
}

class AccountRecord {
  final int id;
  final int accountBookId;
  final int typeId;
  final int categoryId;
  final double amount;
  final DateTime createTime;
  final int payerId;
  final List<int>? participantIds;
  final String? remark;

  AccountRecord(
    this.typeId,
    this.categoryId,
    this.createTime,
    this.payerId,
    this.participantIds,
    this.remark, {
    this.amount = 0,
    required this.id,
    required this.accountBookId,
  });
}

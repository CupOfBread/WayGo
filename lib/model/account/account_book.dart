import 'package:json_annotation/json_annotation.dart';

part 'account_book.g.dart';

@JsonSerializable()
class AccountBook {
  final int id;
  final int ownerId;
  final String name;
  final String? coverUrl;
  final String? description;
  final DateTime createTime;

  const AccountBook({
    required this.id,
    required this.ownerId,
    required this.name,
    this.coverUrl,
    this.description,
    required this.createTime,
  });

  /// 从JSON创建AccountBook对象
  factory AccountBook.fromJson(Map<String, dynamic> json) => 
      _$AccountBookFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$AccountBookToJson(this);

  /// 复制并修改部分字段
  AccountBook copyWith({
    int? id,
    int? ownerId,
    String? name,
    String? coverUrl,
    String? description,
    DateTime? createTime,
  }) {
    return AccountBook(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      coverUrl: coverUrl ?? this.coverUrl,
      description: description ?? this.description,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccountBook &&
        other.id == id &&
        other.ownerId == ownerId &&
        other.name == name &&
        other.coverUrl == coverUrl &&
        other.description == description &&
        other.createTime == createTime;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      ownerId.hashCode ^ 
      name.hashCode ^ 
      coverUrl.hashCode ^ 
      description.hashCode ^ 
      createTime.hashCode;

  @override
  String toString() => 
      'AccountBook(id: $id, ownerId: $ownerId, name: $name, coverUrl: $coverUrl, description: $description, createTime: $createTime)';
}

@JsonSerializable()
class AccountRecord {
  final int id;
  final int accountBookId;
  final int typeId;
  final int categoryId;
  final double amount;
  final DateTime createTime;
  final int? payerId;
  final List<int>? participantIds;
  final String? remark;

  const AccountRecord({
    required this.id,
    required this.accountBookId,
    required this.typeId,
    required this.categoryId,
    this.amount = 0.0,
    required this.createTime,
    this.payerId,
    this.participantIds,
    this.remark,
  });

  /// 从JSON创建AccountRecord对象
  factory AccountRecord.fromJson(Map<String, dynamic> json) => 
      _$AccountRecordFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$AccountRecordToJson(this);

  /// 复制并修改部分字段
  AccountRecord copyWith({
    int? id,
    int? accountBookId,
    int? typeId,
    int? categoryId,
    double? amount,
    DateTime? createTime,
    int? payerId,
    List<int>? participantIds,
    String? remark,
  }) {
    return AccountRecord(
      id: id ?? this.id,
      accountBookId: accountBookId ?? this.accountBookId,
      typeId: typeId ?? this.typeId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      createTime: createTime ?? this.createTime,
      payerId: payerId ?? this.payerId,
      participantIds: participantIds ?? this.participantIds,
      remark: remark ?? this.remark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccountRecord &&
        other.id == id &&
        other.accountBookId == accountBookId &&
        other.typeId == typeId &&
        other.categoryId == categoryId &&
        other.amount == amount &&
        other.createTime == createTime &&
        other.payerId == payerId &&
        other.participantIds == participantIds &&
        other.remark == remark;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      accountBookId.hashCode ^ 
      typeId.hashCode ^ 
      categoryId.hashCode ^ 
      amount.hashCode ^ 
      createTime.hashCode ^ 
      payerId.hashCode ^ 
      participantIds.hashCode ^ 
      remark.hashCode;

  @override
  String toString() => 
      'AccountRecord(id: $id, accountBookId: $accountBookId, typeId: $typeId, categoryId: $categoryId, amount: $amount, createTime: $createTime, payerId: $payerId, participantIds: $participantIds, remark: $remark)';
}

import 'package:json_annotation/json_annotation.dart';

part 'account_record_type.g.dart';

@JsonSerializable()
class AccountRecordType {
  final int id;
  final String code;
  final String name;
  final String? iconUrl;
  final int direction;
  final bool isSysDefault;

  const AccountRecordType({
    required this.id,
    required this.code,
    required this.name,
    this.iconUrl,
    this.direction = 1,
    this.isSysDefault = false,
  });

  /// 从JSON创建AccountRecordType对象
  factory AccountRecordType.fromJson(Map<String, dynamic> json) => 
      _$AccountRecordTypeFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$AccountRecordTypeToJson(this);

  /// 复制并修改部分字段
  AccountRecordType copyWith({
    int? id,
    String? code,
    String? name,
    String? iconUrl,
    int? direction,
    bool? isSysDefault,
  }) {
    return AccountRecordType(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      direction: direction ?? this.direction,
      isSysDefault: isSysDefault ?? this.isSysDefault,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccountRecordType &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other.iconUrl == iconUrl &&
        other.direction == direction &&
        other.isSysDefault == isSysDefault;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      code.hashCode ^ 
      name.hashCode ^ 
      iconUrl.hashCode ^ 
      direction.hashCode ^ 
      isSysDefault.hashCode;

  @override
  String toString() => 
      'AccountRecordType(id: $id, code: $code, name: $name, iconUrl: $iconUrl, direction: $direction, isSysDefault: $isSysDefault)';
}

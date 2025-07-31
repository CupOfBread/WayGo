import 'package:json_annotation/json_annotation.dart';

part 'account_record_category.g.dart';

@JsonSerializable()
class AccountRecordCategory {
  final int id;
  final String code;
  final String name;
  final String? iconUrl;
  final bool isSysDefault;

  const AccountRecordCategory({
    required this.id,
    required this.code,
    required this.name,
    this.iconUrl,
    this.isSysDefault = false,
  });

  /// 从JSON创建AccountRecordCategory对象
  factory AccountRecordCategory.fromJson(Map<String, dynamic> json) => 
      _$AccountRecordCategoryFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$AccountRecordCategoryToJson(this);

  /// 复制并修改部分字段
  AccountRecordCategory copyWith({
    int? id,
    String? code,
    String? name,
    String? iconUrl,
    bool? isSysDefault,
  }) {
    return AccountRecordCategory(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      isSysDefault: isSysDefault ?? this.isSysDefault,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccountRecordCategory &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other.iconUrl == iconUrl &&
        other.isSysDefault == isSysDefault;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      code.hashCode ^ 
      name.hashCode ^ 
      iconUrl.hashCode ^ 
      isSysDefault.hashCode;

  @override
  String toString() => 
      'AccountRecordCategory(id: $id, code: $code, name: $name, iconUrl: $iconUrl, isSysDefault: $isSysDefault)';
}

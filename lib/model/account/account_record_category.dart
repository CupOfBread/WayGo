class AccountRecordCategory {
  final int id;
  final String code;
  final String name;
  final String? iconUrl;
  final bool isSysDefault;

  AccountRecordCategory(
    this.code,
    this.iconUrl, {
    required this.id,
    required this.name,
    this.isSysDefault = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'iconUrl': iconUrl,
    'isSysDefault': isSysDefault,
  };

  factory AccountRecordCategory.fromJson(Map<String, dynamic> json) => AccountRecordCategory(
    json['code'],
    json['iconUrl'],
    id: json['id'],
    name: json['name'],
    isSysDefault: json['isSysDefault'] ?? false,
  );
}

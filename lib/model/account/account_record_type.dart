class AccountRecordType {
  final int id;
  final String code;
  final String name;
  final String? iconUrl;
  final int direction;
  final bool isSysDefault;

  AccountRecordType(
    this.code,
    this.iconUrl, {
    this.direction = 1,
    required this.id,
    required this.name,
    this.isSysDefault = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'iconUrl': iconUrl,
    'direction': direction,
    'isSysDefault': isSysDefault,
  };

  factory AccountRecordType.fromJson(Map<String, dynamic> json) => AccountRecordType(
    json['code'],
    json['iconUrl'],
    direction: json['direction'] ?? 1,
    id: json['id'],
    name: json['name'],
    isSysDefault: json['isSysDefault'] ?? false,
  );
}

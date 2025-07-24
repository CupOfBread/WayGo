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
}

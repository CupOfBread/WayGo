class AccountRecordType {
  final int id;
  final String code;
  final String name;
  final String iconUrl;
  final bool isSysDefault;

  AccountRecordType(
    this.code,
    this.isSysDefault,
    this.iconUrl, {
    required this.id,
    required this.name,
  });
}

class AccountRecordCategory {
  final int id;
  final String code;
  final String name;
  final String iconUrl;
  final bool isSysDefault;

  AccountRecordCategory(
    this.code,
    this.isSysDefault,
    this.iconUrl, {
    required this.id,
    required this.name,
  });
}

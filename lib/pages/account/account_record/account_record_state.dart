class AccountRecordState {
  AccountRecordState() {
    ///初始化变量
    // 分类，默认“景点”
    String category = '景点';
    // 时间，默认当前时间字符串
    String dateTime = DateTime.now().toString().substring(0, 19);
  }
} 
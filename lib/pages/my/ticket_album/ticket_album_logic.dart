import 'dart:math';
import 'package:get/get.dart';

class TicketAlbumLogic extends GetxController {
  late final int movieTicketCount;
  late final int showTicketCount;
  late final int trainTicketCount;
  late final int boardingPassCount;

  @override
  void onInit() {
    super.onInit();
    final random = Random();
    movieTicketCount = random.nextInt(3) + 2;
    showTicketCount = random.nextInt(3) + 2;
    trainTicketCount = random.nextInt(3) + 2;
    boardingPassCount = random.nextInt(3) + 2;
  }
}

import 'package:get/get.dart';
import 'travel_luggage_state.dart';

class TravelLuggageLogic extends GetxController {
  final TravelLuggageState state = TravelLuggageState();

  void toggleItemChecked(int catIdx, LuggageItem item, bool checked) {
    item.checked.value = checked;
  }
} 
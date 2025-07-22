import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'radio_state.dart';

class RadioLogic extends GetxController {
  final RadioState state = RadioState();
  final String streamUrl = 'https://sk.cri.cn/905.m3u8';
  final String radioName = 'CRI 中文环球资讯广播';
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  Future<void> togglePlay() async {
    state.isLoading = true;
    update();
    if (state.isPlaying) {
      await _audioPlayer.pause();
      state.isPlaying = false;
      state.isLoading = false;
      update();
    } else {
      await _audioPlayer.play(UrlSource(streamUrl));
      state.isPlaying = true;
      state.isLoading = false;
      update();
    }
  }
} 
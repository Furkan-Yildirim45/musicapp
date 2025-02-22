import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:main_app_structure/models/track_model.dart';

class TrackDetailViewController extends GetxController {
  late TrackModel track;
  var isPlaying = false.obs; // Şarkının çalıp çalmadığını kontrol et
  final AudioPlayer audioPlayer = AudioPlayer(); // Ses çalar

  @override
  void onInit() {
    super.onInit();
    track = Get.arguments; // TrackModel'i al
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      audioPlayer.pause();
    } else {
      audioPlayer.play(UrlSource(track.audioUrl)); // Ses dosyasını çal
    }
    isPlaying.value = !isPlaying.value; // Çalma durumunu değiştir
  }
} 
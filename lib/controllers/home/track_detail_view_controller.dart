import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:main_app_structure/models/track_model.dart';

class TrackDetailViewController extends GetxController {
  late TrackModel track;
  var isPlaying = false.obs; // Şarkının çalıp çalmadığını kontrol et
  final AudioPlayer audioPlayer = AudioPlayer(); // Ses çalar
  var currentPosition = 0.0.obs; // Şarkının mevcut pozisyonu
  var duration = 0.0.obs; // Şarkının toplam süresi

  @override
  void onInit() {
    super.onInit();
    track = Get.arguments; // TrackModel'i al
    audioPlayer.onDurationChanged.listen((d) {
      duration.value = d.inSeconds.toDouble(); // Toplam süreyi güncelle
    });
    audioPlayer.onPositionChanged.listen((p) {
      currentPosition.value = p.inSeconds.toDouble(); // Mevcut pozisyonu güncelle
    });
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      audioPlayer.pause();
    } else {
      audioPlayer.play(UrlSource(track.audioUrl)); // Ses dosyasını çal
    }
    isPlaying.value = !isPlaying.value; // Çalma durumunu değiştir
  }

  void seekTo(double value) {
    audioPlayer.seek(Duration(seconds: value.toInt())); // İlerleme çubuğuna göre pozisyonu ayarla
  }

  // Süreyi "mm:ss" formatında döndüren metot
  String formatDuration(double seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
} 
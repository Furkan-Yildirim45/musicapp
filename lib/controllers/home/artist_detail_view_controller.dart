import 'package:get/get.dart';
import 'package:main_app_structure/models/artist_model.dart';

class ArtistDetailViewController extends GetxController {
  late ArtistModel artist;

  @override
  void onInit() {
    super.onInit();
    artist = Get.arguments; // ArtistModel'i al
    print("artist.tracks.length : ${artist.tracks.length}");
    print("artist.tracks : ${artist.tracks}");
  }
} 
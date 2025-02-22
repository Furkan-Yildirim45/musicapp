import 'package:get/get.dart';
import 'package:main_app_structure/models/artist_model.dart';

class ArtistDetailViewController extends GetxController {
  late ArtistModel artist;

  @override
  void onInit() {
    super.onInit();
    artist = Get.arguments; // ArtistModel'i al
  }
} 
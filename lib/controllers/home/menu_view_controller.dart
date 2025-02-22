import 'package:get/get.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/models/track_model.dart';

class MenuViewController extends GetxController {
  var tracks = <TrackModel>[].obs;
  var artists = <ArtistModel>[].obs;
  var menuTitle = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is List<TrackModel>) {
      setTracks(arguments);
      menuTitle.value = "Top Tracks";
    } else if (arguments is List<ArtistModel>) {
      setArtists(arguments);
      menuTitle.value = "Popular Artists";
    }
  }

  void setTracks(List<TrackModel> newTracks) {
    tracks.value = newTracks;
  }

  void setArtists(List<ArtistModel> newArtists) {
    artists.value = newArtists;
  }
} 
import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/models/track_model.dart';

class MenuViewController extends GetxController {
  var tracks = <TrackModel>[].obs;
  var filteredTracks = <TrackModel>[].obs;
  var artists = <ArtistModel>[].obs;
  var filteredArtists = <ArtistModel>[].obs;
  var menuTitle = ''.obs;
  final TextEditingController searchController = TextEditingController();

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
    filteredTracks.value = newTracks;
  }

  void setArtists(List<ArtistModel> newArtists) {
    artists.value = newArtists;
    filteredArtists.value = newArtists;
  }

  void filterTracks(String query) {
    if (query.isEmpty) {
      filteredTracks.value = tracks;
      filteredArtists.value = artists;
    } else {
      filteredTracks.value = tracks.where((track) {
        return track.title.toLowerCase().contains(query.toLowerCase());
      }).toList();

      filteredArtists.value = artists.where((artist) {
        return artist.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
} 
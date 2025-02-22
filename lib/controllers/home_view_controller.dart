import 'package:get/get.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/models/track_model.dart';

class HomeViewController extends GetxController {
  var selectedCategory = ''.obs; // Seçilen kategori
  final List<String> categories = ['Pop', 'Rock', 'Hip-Hop', 'Jazz'];

  // Top Tracks verileri
  final List<TrackModel> topTracks = [
    TrackModel(
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      views: '11M listeners',
      image: 'assets/images/blinding_lights.png',
    ),
    TrackModel(
      title: 'Shape of You',
      artist: 'Ed Sheeran',
      views: '10M listeners',
      image: 'assets/images/shape_of_you.png',
    ),
  ];

  // New Releases verileri
  final List<TrackModel> newReleases = [
    TrackModel(
      title: 'New Album',
      artist: 'Artist Name',
      views: '5M listeners',
      image: 'assets/images/charlie.png',
    ),
    TrackModel(
      title: 'Latest Hits',
      artist: 'Another Artist',
      views: '3M listeners',
      image: 'assets/images/hits.png',
    ),
  ];

  // Popular Artists verileri
  final List<ArtistModel> popularArtists = [
    ArtistModel(
      name: 'Adele',
      image: 'assets/images/adele.png',
      views: '120M',
    ),
    ArtistModel(
      name: 'Drake',
      image: 'assets/images/drake.png',
      views: '90M',
    ),
  ];

  void selectCategory(String category) {
    selectedCategory.value = category; // Seçilen kategoriyi güncelle
  }
} 
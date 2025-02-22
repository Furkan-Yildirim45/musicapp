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
      lyrics:
          'I said, ooh, I\'m blinded by the lights...\nCan\'t sleep until I feel your touch...',
      duration: '3:20', // Örnek süre
      audioUrl: 'https://example.com/blinding_lights.mp3', // Örnek URL
    ),
    TrackModel(
      title: 'Shape of You',
      artist: 'Ed Sheeran',
      views: '10M listeners',
      image: 'assets/images/shape_of_you.png',
      lyrics:
          'I\'m in love with the shape of you...\nWe push and pull like a magnet do...',
      duration: '3:53', // Örnek süre
      audioUrl: 'https://example.com/shape_of_you.mp3', // Örnek URL
    ),
  ];

  // New Releases verileri
  final List<TrackModel> newReleases = [
    TrackModel(
      title: 'New Album',
      artist: 'Artist Name',
      views: '5M listeners',
      image: 'assets/images/charlie.png',
      lyrics: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      duration: '4:00', // Örnek süre
      audioUrl: 'https://example.com/new_album.mp3', // Örnek URL
    ),
    TrackModel(
      title: 'Latest Hits',
      artist: 'Another Artist',
      views: '3M listeners',
      image: 'assets/images/hits.png',
      lyrics: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      duration: '3:45', // Örnek süre
      audioUrl: 'https://example.com/latest_hits.mp3', // Örnek URL
    ),
  ];

  // Popular Artists verileri
  final List<ArtistModel> popularArtists = [
    ArtistModel(
      name: 'Adele',
      image: 'assets/images/adele.png',
      views: '120M',
      tracks: [
        TrackModel(
          title: 'Hello',
          artist: 'Adele',
          views: '50M',
          image: 'assets/images/adele.png',
          lyrics: 'Hello from the other side...',
          duration: '4:55',
          audioUrl: 'https://example.com/hello.mp3',
        ),
        TrackModel(
          title: 'Someone Like You',
          artist: 'Adele',
          views: '40M',
          image: 'assets/images/adele.png',
          lyrics: 'Never mind, I\'ll find someone like you...',
          duration: '4:45',
          audioUrl: 'https://example.com/someone_like_you.mp3',
        ),
        TrackModel(
          title: 'Hello',
          artist: 'Adele',
          views: '50M',
          image: 'assets/images/adele.png',
          lyrics: 'Hello from the other side...',
          duration: '4:55',
          audioUrl: 'https://example.com/hello.mp3',
        ),
        TrackModel(
          title: 'Someone Like You',
          artist: 'Adele',
          views: '40M',
          image: 'assets/images/adele.png',
          lyrics: 'Never mind, I\'ll find someone like you...',
          duration: '4:45',
          audioUrl: 'https://example.com/someone_like_you.mp3',
        ),
      ],
    ),
    ArtistModel(
      name: 'Drake',
      image: 'assets/images/drake.png',
      views: '90M',
      tracks: [
        TrackModel(
          title: 'God\'s Plan',
          artist: 'Drake',
          views: '30M',
          image: 'assets/images/drake.png',
          lyrics: 'I can\'t do this on my own...',
          duration: '3:19',
          audioUrl: 'https://example.com/gods_plan.mp3',
        ),
        TrackModel(
          title: 'In My Feelings',
          artist: 'Drake',
          views: '25M',
          image: 'assets/images/drake.png',
          lyrics: 'Kiki, do you love me...',
          duration: '3:37',
          audioUrl: 'https://example.com/in_my_feelings.mp3',
        ),
      ],
    ),
  ];

  void selectCategory(String category) {
    selectedCategory.value = category; // Seçilen kategoriyi güncelle
  }
}

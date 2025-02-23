import 'package:get/get.dart';
import 'package:main_app_structure/api/service.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/models/track_model.dart';

class HomeViewController extends GetxController {
  final AuthService _authService = AuthService();
  var selectedCategory = ''.obs; // Seçilen kategori
  final List<String> categories = ['Pop', 'Rock', 'Hip-Hop', 'Jazz'];

  // Top Tracks verileri
  var topTracks = <TrackModel>[].obs;

  // New Releases verileri
  var newReleases = <TrackModel>[].obs;

  // Popular Artists verileri
  var artists = <ArtistModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Verileri çek
  }

  // Verileri çekmek için bir metod
  Future<void> fetchData() async {
    artists.value = await _authService.fetchArtists();
    newReleases.value = await _authService.fetchNewReleases();
    topTracks.value = await _authService.fetchTopTracks();

    printData(); // Verileri yazdır
  }

  void selectCategory(String category) {
    selectedCategory.value = category; // Seçilen kategoriyi güncelle
  }

  // Verileri yazdırmak için bir metot
  void printData() {
    print("Sanatçılar:");
    for (var artist in artists) {
      print("Name: ${artist.name}, Image: ${artist.image}, Views: ${artist.views}");
    }

    print("Yeni Çıkanlar:");
    for (var track in newReleases) {
      print("Title: ${track.title}, Artist: ${track.artist}, Duration: ${track.duration}, Audio URL: ${track.audioUrl}");
    }

    print("En İyi Şarkılar:");
    for (var track in topTracks) {
      print("Title: ${track.title}, Artist: ${track.artist}, Duration: ${track.duration}, Audio URL: ${track.audioUrl}");
    }
  }
}




import 'package:main_app_structure/models/track_model.dart';

class ArtistModel {
  final String name;
  final String image;
  final String views;
  final List<TrackModel> tracks; // Sanatçının şarkı listesi

  ArtistModel({
    required this.name,
    required this.image,
    required this.views,
    required this.tracks, // Şarkı listesi
  });
} 
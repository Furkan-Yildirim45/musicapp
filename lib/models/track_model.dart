class TrackModel {
  final String title;
  final String artist;
  final String views;
  final String image;
  final String lyrics;
  final int duration;
  final String audioUrl;
  final String genre;

  TrackModel({
    required this.title,
    required this.artist,
    required this.views,
    required this.image,
    required this.lyrics,
    required this.duration,
    required this.audioUrl,
    required this.genre,
  });

  factory TrackModel.fromMap(Map<String, dynamic> data) {
    return TrackModel(
      title: data['title'],
      artist: data['artist'],
      views: data['views'],
      image: data['image'],
      lyrics: data['lyrics'],
      duration: data['duration'],
      audioUrl: data['audioUrl'],
      genre: data['genre'],
    );
  }
} 
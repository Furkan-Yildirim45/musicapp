import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/models/track_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Dio _dio = Dio();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Kullanıcıyı giriş yapma
  Future<User?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyChIeD0pPZGJc2uEDwyzN2DxegBSIdZF2Y',
        data: {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      );

      // Firebase'den dönen kullanıcı bilgilerini al
      final user = response.data;
      print("Giriş yanıtı: $user"); // Yanıtı yazdır

      // Kullanıcı girişi başarılı ise, kullanıcıyı döndür
      if (user != null && user['idToken'] != null) {
        // Kullanıcıyı döndür
        return _auth.currentUser; // Burada kullanıcıyı döndür
      } else {
        print("Giriş başarısız: ${user['error']['message']}");
        return null;
      }
    } catch (e) {
      if (e is DioException) {
        print("Login error: ${e.response?.data}"); // Hata detayını yazdır
      } else {
        print("Login error: $e");
      }
      return null;
    }
  }

  // Kullanıcı kaydı
  Future<User?> register(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyChIeD0pPZGJc2uEDwyzN2DxegBSIdZF2Y',
        data: {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      );

      // Firebase'den dönen kullanıcı bilgilerini al
      final user = response.data;
      print("Kayıt yanıtı: $user"); // Yanıtı yazdır

      // Kullanıcı kaydı başarılı ise, kullanıcıyı döndür
      if (user != null && user['idToken'] != null) {
        // Kullanıcıyı oturum açtır
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential.user; // Kullanıcıyı döndür
      } else {
        print("Kullanıcı kaydedilemedi: ${user['error']['message']}");
        return null;
      }
    } catch (e) {
      if (e is DioException) {
        print("Registration error: ${e.response?.data}"); // Hata detayını yazdır
      } else {
        print("Registration error: $e");
      }
      return null;
    }
  }

  // Kullanıcıyı çıkış yapma
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Sanatçılar ve şarkılar için verileri çekme
  Future<List<ArtistModel>> fetchArtists() async {
    try {
      QuerySnapshot artistSnapshot = await _firestore.collection('artists').get();
      
      if (artistSnapshot.docs.isEmpty) {
        print("Sanatçı koleksiyonu boş!");
        return [];
      }

      return artistSnapshot.docs.map((doc) {
        return ArtistModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Sanatçı verilerini çekme hatası: $e");
      return [];
    }
  }

  Future<List<TrackModel>> fetchNewReleases() async {
    try {
      QuerySnapshot newReleasesSnapshot = await _firestore.collection('newReleases').get();
      return newReleasesSnapshot.docs.map((doc) {
        return TrackModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Yeni sürüm verilerini çekme hatası: $e");
      return [];
    }
  }

  Future<List<TrackModel>> fetchTopTracks() async {
    try {
      QuerySnapshot topTracksSnapshot = await _firestore.collection('topTracks').get();
      return topTracksSnapshot.docs.map((doc) {
        return TrackModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("En iyi şarkı verilerini çekme hatası: $e");
      return [];
    }
  }
} 
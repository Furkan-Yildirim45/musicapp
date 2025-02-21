import 'package:flutter/material.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset("assets/images/logo.png",
        width: 56,
        height: 56,),
        backgroundColor: AppColor.white.getColor(), // Spotify yeşili
        actions: const [
          Text("Catalog",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
      body: Column(
        children: [
          Divider(color: Colors.grey[300],),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kategoriler
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryButton('Pop'),
                    _buildCategoryButton('Rock'),
                    _buildCategoryButton('Hip-Hop'),
                    _buildCategoryButton('Jazz'),
                  ],
                ),
                const SizedBox(height: 16),
                // En Çok Dinlenenler
                const Text(
                  'Top Tracks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildTrackCard('Blinding Lights', 'The Weeknd', '3:20', 'assets/images/blinding_lights.png'),
                _buildTrackCard('Shape of You', 'Ed Sheeran', '3:53', 'assets/images/shape_of_you.png'),
                const SizedBox(height: 16),
                // Popüler Sanatçılar
                const Text(
                  'Popular Artists',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildArtistCard('Adele', 'assets/images/adele.png'),
                _buildArtistCard('Drake', 'assets/images/drake.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title) {
    return ElevatedButton(
      onPressed: () {
        // Kategori butonuna tıklandığında yapılacak işlemler
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xffF4F4FF),
        backgroundColor: const Color(0xff6251DD),
      ),
      child: Text(title),
    );
  }

  Widget _buildTrackCard(String title, String artist, String duration, String imagePath) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(artist),
                Text(duration, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCard(String name, String imagePath) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            const SizedBox(width: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
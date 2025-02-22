import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/home/home_view_controller.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/models/track_model.dart';
import 'package:main_app_structure/models/artist_model.dart';

class HomeView extends StatelessWidget {
  final HomeViewController controller = Get.put(HomeViewController());

  HomeView({super.key}); // Controller'ı oluştur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo.png",
          width: 56,
          height: 56,
        ),
        backgroundColor: AppColor.white.getColor(), // Spotify yeşili
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              "Catalog",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey[300],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Kategoriler
                  SizedBox(
                    height: 50, // Yüksekliği ayarlayın
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        return _buildCategoryButton(
                            controller.categories[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Arama Çubuğu
                  _buildSearchBar(),
                  const SizedBox(height: 16),
                  // En Çok Dinlenenler
                  _buildTopTracksSection(),
                  const SizedBox(height: 16),
                  // Yeni Çıkanlar
                  _buildNewReleasesSection(),
                  const SizedBox(height: 16),
                  // Popüler Sanatçılar
                  _buildPopularArtistsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopTracksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Tracks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: const Text(
                "View All",
                style: TextStyle(color: Color(0xffEF6B4A)),
              ),
              onPressed: () {
                NavigatorController.instance.pushToPage(
                    NavigateRoutesItems.menu,
                    arguments: controller.topTracks);
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: controller.topTracks.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  right: index == controller.topTracks.length - 1 ? 0 : 12),
              child: _buildTrackCard(controller.topTracks[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularArtistsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular Artists',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: const Text(
                "View All",
                style: TextStyle(color: Color(0xffEF6B4A)),
              ),
              onPressed: () {
                NavigatorController.instance.pushToPage(
                  NavigateRoutesItems.menu,
                  arguments: controller.popularArtists,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: controller.popularArtists.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  right:
                      index == controller.popularArtists.length - 1 ? 0 : 12),
              child: _buildArtistCard(controller.popularArtists[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewReleasesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'New Releases',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: const Text(
                "View All",
                style: TextStyle(color: Color(0xffEF6B4A)),
              ),
              onPressed: () {
                NavigatorController.instance.pushToPage(
                  NavigateRoutesItems.menu,
                  arguments: controller.newReleases,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: controller.newReleases.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  right: index == controller.newReleases.length - 1 ? 0 : 12),
              child: _buildTrackCard(controller.newReleases[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF4F4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          contentPadding: const EdgeInsets.only(top: 12),
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.filter_list, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title) {
    return Obx(() {
      bool isSelected = controller.selectedCategory.value ==
          title; // Seçili olup olmadığını kontrol et
      return GestureDetector(
        onTap: () {
          controller.selectCategory(title); // Kategori seçildiğinde güncelle
        },
        child: Container(
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xff6251DD) : const Color(0xffF4F4FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : const Color(0xff090937).withAlpha(128),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTrackCard(TrackModel track) {
    return InkWell(
      onTap: () {
        NavigatorController.instance.pushToPage(
          NavigateRoutesItems.trackDetail,
          arguments: track,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF4F4FF),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              track.image,
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ), // Resim boyutunu ayarlayın
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(track.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(track.artist, style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 32),
                Text(track.views,
                    style: const TextStyle(
                        color: Color(0xff6251DD), fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCard(ArtistModel artist) {
    return InkWell(
      onTap: () {
        NavigatorController.instance.pushToPage(
          NavigateRoutesItems.artistDetail,
          arguments: artist,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF4F4FF),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              artist.image,
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(artist.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text("Total views: ${artist.views}",
                    style: TextStyle(color: Colors.grey[700])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

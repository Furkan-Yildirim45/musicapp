import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/menu_view_controller.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/models/track_model.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';

class MenuView extends StatelessWidget {
  final MenuViewController controller = Get.put(MenuViewController());

  MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconButton(
            onPressed: () {
              NavigatorController.instance.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: AppColor.white.getColor(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              controller.menuTitle.value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 16),
              Expanded(
                child: controller.tracks.isNotEmpty
                    ? _buildTrackGrid(controller.tracks)
                    : controller.artists.isNotEmpty
                        ? _buildArtistGrid(controller.artists)
                        : const Center(child: Text("No data available")),
              ),
            ],
          ),
        );
      }),
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

  Widget _buildTrackGrid(List<TrackModel> tracks) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 sütun
        childAspectRatio: 0.6, // Kartların oranı
        crossAxisSpacing: 16.0, // Sütunlar arası boşluk
        mainAxisSpacing: 16.0, // Satırlar arası boşluk
      ),
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: const Color(0xffF4F4FF),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    tracks[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tracks[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  tracks[index].artist,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 8),
                Text(
                  tracks[index].views,
                  style: const TextStyle(
                    color: Color(0xff6251DD),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildArtistGrid(List<ArtistModel> artists) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 sütun
        childAspectRatio: 0.6, // Kartların oranı
        crossAxisSpacing: 16.0, // Sütunlar arası boşluk
        mainAxisSpacing: 16.0, // Satırlar arası boşluk
      ),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    artists[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  artists[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Total views: ${artists[index].views}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

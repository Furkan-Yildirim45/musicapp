import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/home/track_detail_view_controller.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/widgets/general/custom_elevated_button.dart';

class TrackDetailView extends StatelessWidget {
  final TrackDetailViewController controller =
      Get.put(TrackDetailViewController());

  TrackDetailView({super.key});

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
              controller.track.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 48,),
              Column(
                children: [
                  // Image
                  Image.network(
                    controller.track.image,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  const SizedBox(height: 16),
                  // Title
                  Text(
                    controller.track.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Artist
                  Text(
                    controller.track.artist,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
              CustomElevatedButton(
                  elevation: 0,
                  height: 48,
                  width: 48,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  backgroundColor: const Color(0xffF4F4FF),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 24,
                  ),
                  onPressed: () {})
            ],
          ),
          const SizedBox(height: 16),
          // Lyrics
          const Text(
            "Lyrics",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(controller.track.lyrics),
          const SizedBox(height: 16),
          // Progress Bar
          Obx(() {
            return Column(
              children: [
                Slider(
                  value: controller.isPlaying.value ? 0.5 : 0.0, // Örnek değer
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    // İlerleme çubuğu değiştiğinde yapılacak işlemler
                  },
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("0:00"),
                    Text("2:23"), // Örnek toplam süre
                  ],
                ),
              ],
            );
          }),
        ],
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton.extended(
          onPressed: () {
            controller.togglePlayPause(); // Play/Pause işlevselliği
          },
          label: Text(controller.isPlaying.value ? "Pause" : "Play"),
          icon: Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow),
          backgroundColor: const Color(0xffEF6B4A),
          // Buton boyutunu dinamik olarak ayarlama
          elevation: controller.isPlaying.value ? 6 : 0,
        );
      }),
    );
  }
}

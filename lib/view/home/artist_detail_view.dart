import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/home/artist_detail_view_controller.dart';
import 'package:main_app_structure/models/track_model.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';

class ArtistDetailView extends StatelessWidget {
  final ArtistDetailViewController controller =
      Get.put(ArtistDetailViewController());

  ArtistDetailView({super.key});

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
              controller.artist.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Sanatçı Resmi
            Image.network(
              controller.artist.image,
              height: 250,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            // Sanatçı Adı
            Text(controller.artist.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // Toplam Görüntüleme
            Text("Total views: ${controller.artist.views}",
                style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 16),
            // Şarkı Listesi Başlığı
            const Text("Tracks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // Şarkı Listesi

            SizedBox(
              height: controller.artist.tracks.length * 150 +
                  (controller.artist.tracks.length - 1) * 10,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    controller.artist.tracks.length, // Sanatçının şarkı sayısı
                itemBuilder: (context, index) {
                  TrackModel track = controller.artist.tracks[index];
                  return InkWell(
                    onTap: () {
                      NavigatorController.instance.pushToPage(
                        NavigateRoutesItems.trackDetail,
                        arguments: track,
                      );
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.only(bottom: index == 3 ? 0 : 10),
                      decoration: BoxDecoration(
                          color: const Color(0xffF4F4FF),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                track.image,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    track.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    track.artist,
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    track.views,
                                    style: const TextStyle(
                                      color: Color(0xff6251DD),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

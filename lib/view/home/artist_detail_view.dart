import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/home/artist_detail_view_controller.dart';
import 'package:main_app_structure/models/track_model.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';
import 'package:main_app_structure/product/utils/app_utils/app_radius.dart';
import 'package:main_app_structure/product/utils/app_utils/app_spaces..dart';

class ArtistDetailView extends StatelessWidget {
  final ArtistDetailViewController controller =
      Get.put(ArtistDetailViewController());

  ArtistDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: AppPadding.instance.horizontalMedium,
        child: ListView(
          children: [
            // Sanatçı Resmi
            _buildArtistImage(),
            AppSpaces.instance.vertical15,
            // Sanatçı Adı
            Text(controller.artist.name,
                style: context.appGeneral.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            AppSpaces.instance.vertical10,
            // Toplam Görüntüleme
            Text("Total views: ${controller.artist.views}",
                style: TextStyle(color: Colors.grey[700])),
            AppSpaces.instance.vertical15,
            // Şarkı Listesi Başlığı
            Text("Tracks",
                style: context.appGeneral.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            AppSpaces.instance.vertical10,
            // Şarkı Listesi
            _buildPageListView(),
          ],
        ),
      ),
    );
  }

  SizedBox _buildPageListView() {
    return SizedBox(
      height: controller.artist.tracks.length * Get.height * 0.22 +
          (controller.artist.tracks.length - 1) * 10,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.artist.tracks.length, // Sanatçının şarkı sayısı
        itemBuilder: (context, index) {
          TrackModel track = controller.artist.tracks[index];
          return _buildListViewCard(track, index, context);
        },
      ),
    );
  }

  InkWell _buildListViewCard(
      TrackModel track, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorController.instance.pushToPage(
          NavigateRoutesItems.trackDetail,
          arguments: track,
        );
      },
      child: Container(
        height: Get.height * 0.22,
        margin: EdgeInsets.only(bottom: index == 3 ? 0 : 10),
        decoration: BoxDecoration(
            color: AppColor.maWhite.getColor(),
            borderRadius: AppRadius.instance.normalBorderRadius),
        child: Padding(
          padding: AppPadding.instance.allNormal,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  track.image,
                  height: Get.height * 0.22,
                  fit: BoxFit.cover,
                ),
              ),
              AppSpaces.instance.vertical10,
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(track.title,
                        style: context.appGeneral.textTheme.titleMedium),
                    Text(
                      track.artist,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    AppSpaces.instance.vertical10,
                    Text(
                      track.views,
                      style: context.appGeneral.textTheme.bodyLarge?.copyWith(
                          color: AppColor.majorelleBlue.getColor(),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Image _buildArtistImage() {
    return Image.network(
      controller.artist.image,
      height: Get.height * 0.36,
      width: double.infinity,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: IconButton(
          onPressed: () {
            NavigatorController.instance.pop();
          },
          icon: const Icon(Icons.arrow_back_ios)),
      backgroundColor: AppColor.white.getColor(),
      actions: [
        Padding(
          padding: AppPadding.instance.rightMedium,
          child: Text(controller.artist.name,
              style: context.appGeneral.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

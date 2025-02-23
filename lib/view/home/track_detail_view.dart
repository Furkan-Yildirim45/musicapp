import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/home/track_detail_view_controller.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';
import 'package:main_app_structure/product/utils/app_utils/app_spaces..dart';
import 'package:main_app_structure/product/widgets/general/custom_elevated_button.dart';

class TrackDetailView extends StatelessWidget {
  final TrackDetailViewController controller =
      Get.put(TrackDetailViewController());

  TrackDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: AppPadding.instance.horizontalMedium,
        children: [
          _buildTrackInfoComponents(context),
          AppSpaces.instance.vertical15,
          // Lyrics
          _buildLyricsTitleText(context),
          AppSpaces.instance.vertical10,
          Text(controller.track.lyrics),
          AppSpaces.instance.vertical15,
          // Progress Bar
          _buildProgressBar(),
          SizedBox(height: Get.height * 0.12),
        ],
      ),
      floatingActionButton: _buildAppFloatActionButton(context),
    );
  }

  Obx _buildAppFloatActionButton(BuildContext context) {
    return Obx(() {
      return FloatingActionButton.extended(
        onPressed: () {
          controller.togglePlayPause(); // Play/Pause işlevselliği
        },
        label: Text(
          controller.isPlaying.value ? "Pause" : "Play",
          style: context.appGeneral.textTheme.bodyMedium
              ?.copyWith(color: AppColor.white.getColor()),
        ),
        icon: Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
            color: AppColor.white.getColor()),
        backgroundColor: AppColor.entanRed.getColor(),
        // Buton boyutunu dinamik olarak ayarlama
        elevation: controller.isPlaying.value ? 6 : 0,
      );
    });
  }

  Obx _buildProgressBar() {
    return Obx(() {
      return Column(
        children: [
          Slider(
            value: controller.currentPosition.value,
            min: 0,
            max: controller.duration.value,
            onChanged: (value) {
              controller.seekTo(
                  value); // İlerleme çubuğu değiştiğinde pozisyonu ayarla
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.formatDuration(
                  controller.currentPosition.value)), // Mevcut süre
              Text(controller
                  .formatDuration(controller.duration.value)), // Toplam süre
            ],
          ),
        ],
      );
    });
  }

  Text _buildLyricsTitleText(BuildContext context) {
    return Text("Lyrics",
        style: context.appGeneral.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.bold));
  }

  Row _buildTrackInfoComponents(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 48),
        Column(
          children: [
            // Image
            Image.network(
              controller.track.image,
              fit: BoxFit.cover,
              height: Get.width * 0.6,
              width: Get.width * 0.6,
            ),
            AppSpaces.instance.vertical15,
            // Title
            Text(controller.track.title,
                style: context.appGeneral.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            AppSpaces.instance.vertical10,
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: AppColor.maWhite.getColor(),
            child: const Icon(
              Icons.favorite_border,
              size: 24,
            ),
            onPressed: () {})
      ],
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
          child: Text(controller.track.title,
              style: context.appGeneral.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

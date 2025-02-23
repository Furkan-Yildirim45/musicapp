import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/home/menu_view_controller.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/models/track_model.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';
import 'package:main_app_structure/product/utils/app_utils/app_radius.dart';
import 'package:main_app_structure/product/utils/app_utils/app_spaces..dart';

class MenuView extends StatelessWidget {
  final MenuViewController controller = Get.put(MenuViewController());

  MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() {
        return Padding(
          padding: AppPadding.instance.horizontalMedium,
          child: Column(
            children: [
              _buildSearchBar(),
              AppSpaces.instance.vertical15,
              _buildGridViewBuilder(),
            ],
          ),
        );
      }),
    );
  }

  Expanded _buildGridViewBuilder() {
    return Expanded(
      child: controller.filteredTracks.isNotEmpty
          ? _buildTrackGrid(controller.filteredTracks)
          : controller.filteredArtists.isNotEmpty
              ? _buildArtistGrid(controller.filteredArtists)
              : const Center(child: Text("No data available")),
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
          child: Text(controller.menuTitle.value,
              style: context.appGeneral.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.maWhite.getColor(),
        borderRadius: AppRadius.instance.normalBorderRadius,
      ),
      child: TextField(
        controller: controller.searchController,
        onChanged: (value) {
          controller.filterTracks(value); // Filtreleme işlemi
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          contentPadding: AppPadding.instance.topNormal,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(Icons.search, color: AppColor.grey.getColor()),
          suffixIcon: Icon(Icons.filter_list, color: AppColor.grey.getColor()),
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
        return InkWell(
          onTap: () {
            NavigatorController.instance.pushToPage(
              NavigateRoutesItems.trackDetail,
              arguments: tracks[index],
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.maWhite.getColor(),
                borderRadius: AppRadius.instance.normalBorderRadius),
            child: Padding(
              padding: AppPadding.instance.allNormal,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      tracks[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AppSpaces.instance.vertical10,
                  Text(tracks[index].title,
                      style: context.appGeneral.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  Text(
                    tracks[index].artist,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  AppSpaces.instance.vertical10,
                  Text(tracks[index].views,
                      style: context.appGeneral.textTheme.titleSmall
                          ?.copyWith(color: AppColor.majorelleBlue.getColor())),
                ],
              ),
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
        return InkWell(
          onTap: () {
            NavigatorController.instance.pushToPage(
              NavigateRoutesItems.artistDetail,
              arguments: artists[index],
            );
          },
          child: Card(
            child: Padding(
              padding: AppPadding.instance.allNormal,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      artists[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AppSpaces.instance.vertical10,
                  Text(artists[index].name,
                      style: context.appGeneral.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  AppSpaces.instance.vertical10,
                  Text("Total views: ${artists[index].views}",
                      style: context.appGeneral.textTheme.titleSmall
                          ?.copyWith(color: AppColor.majorelleBlue.getColor())),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

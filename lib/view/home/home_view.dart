import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/home/home_view_controller.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/services/icon_and_image_services.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/models/track_model.dart';
import 'package:main_app_structure/models/artist_model.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';
import 'package:main_app_structure/product/utils/app_utils/app_radius.dart';
import 'package:main_app_structure/product/utils/app_utils/app_spaces..dart';

class HomeView extends StatelessWidget {
  final HomeViewController controller = Get.put(HomeViewController());
  final TextEditingController _searchController = TextEditingController();

  HomeView({super.key}); // Controller'ı oluştur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buidCircularProgressIndicator();
        } else {
          return _buildBody(context);
        }
      }),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey[300],
        ),
        Expanded(
          child: Padding(
            padding: AppPadding.instance.allMedium,
            child: ListView(
              children: [
                // Kategoriler
                _buildPageCategories(),
                AppSpaces.instance.vertical15,
                // Arama Çubuğu
                _buildSearchBar(),
                AppSpaces.instance.vertical15,
                // En Çok Dinlenenler
                _buildTopTracksSection(context),
                AppSpaces.instance.vertical15,
                // Yeni Çıkanlar
                _buildNewReleasesSection(context),
                AppSpaces.instance.vertical15,
                // Popüler Sanatçılar
                _buildPopularArtistsSection(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildPageCategories() {
    return SizedBox(
      height: Get.height * 0.075, // Yüksekliği ayarlayın
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryButton(context, controller.categories[index]);
        },
      ),
    );
  }

  Center _buidCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.majorelleBlue.getColor(), // Loading bar rengi
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        AppImageUtility.getImagePath("logo", format: ImageFormat.png),
        width: Get.height * 0.09,
        height: Get.height * 0.09,
      ),
      backgroundColor: AppColor.white.getColor(), // Arka plan rengi
      actions: [
        Padding(
          padding: AppPadding.instance.rightMedium,
          child: Text(
            "Catalog",
            style: context.appGeneral.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _buildTopTracksSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Tracks',
              style: context.appGeneral.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: Text(
                "View All",
                style: TextStyle(color: AppColor.entanRed.getColor()),
              ),
              onPressed: () {
                NavigatorController.instance.pushToPage(
                    NavigateRoutesItems.menu,
                    arguments: controller.topTracks);
              },
            ),
          ],
        ),
        AppSpaces.instance.vertical10,
        SizedBox(
          height: Get.height * 0.24,
          width: double.infinity,
          child: Obx(() {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: controller.topTracks.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                    right: index == controller.topTracks.length - 1 ? 0 : 12),
                child: _buildTrackCard(controller.topTracks[index]),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPopularArtistsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Artists',
              style: context.appGeneral.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: Text(
                "View All",
                style: TextStyle(color: AppColor.entanRed.getColor()),
              ),
              onPressed: () {
                NavigatorController.instance.pushToPage(
                  NavigateRoutesItems.menu,
                  arguments: controller.artists,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Obx(() {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: controller.artists.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                    right: index == controller.artists.length - 1 ? 0 : 12),
                child: _buildArtistCard(controller.artists[index]),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildNewReleasesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Releases',
              style: context.appGeneral.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: Text(
                "View All",
                style: TextStyle(color: AppColor.entanRed.getColor()),
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
        AppSpaces.instance.vertical10,
        SizedBox(
          height: Get.height * 0.24,
          width: double.infinity,
          child: Obx(() {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: controller.newReleases.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                    right: index == controller.newReleases.length - 1 ? 0 : 12),
                child: _buildTrackCard(controller.newReleases[index]),
              ),
            );
          }),
        ),
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
        controller: _searchController,
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

  Widget _buildCategoryButton(BuildContext context, String title) {
    return Obx(() {
      bool isSelected = controller.selectedCategory.value ==
          title; // Seçili olup olmadığını kontrol et
      return GestureDetector(
        onTap: () {
          controller.selectCategory(title); // Kategori seçildiğinde güncelle
        },
        child: Container(
          margin: AppPadding.instance.rightSmall,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColor.majorelleBlue.getColor()
                : AppColor.maWhite.getColor(),
            borderRadius: AppRadius.instance.largeBorderRadius,
          ),
          child: Center(
            child: Text(title,
                style: context.appGeneral.textTheme.bodyMedium?.copyWith(
                    color: AppColor.black.getColor().withAlpha(128))),
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
            Image.network(
              track.image,
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ),
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
            Image.network(
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

// https://raw.githubusercontent.com/Furkan-Yildirim45/musicapp-datas/master/images/someone_like_you.png
// https://raw.githubusercontent.com/Furkan-Yildirim45/musicapp-datas/master/Someone-Like-You-Adele-_Lyrics_-_.mp3

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/services/icon_and_image_services.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';
import 'package:main_app_structure/product/utils/app_utils/app_spaces..dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.indigo900.getColor(), // Arka plan rengi
      body: Padding(
        padding: AppPadding.instance.horizontalMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSpaces.instance.space,
            _buildPageLogo(),
            AppSpaces.instance.space, 
            Column(
              children: [
                _buildLoginButton(context),
                AppSpaces.instance.vertical20,
                _buildSkipButton(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding _buildSkipButton(BuildContext context) {
    return Padding(
      padding: AppPadding.instance.bottomMedium,
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStateProperty.all(
                AppColor.indigo900.getColor(),
              ) // Arka plan rengi
              ),
          onPressed: () {
            NavigatorController.instance.pushToPage(NavigateRoutesItems.login);
          },
          child: Text(
            'Skip',
            style: context.appGeneral.textTheme.titleMedium
                ?.copyWith(color: AppColor.white.getColor()), // Yazı rengi
          ),
        ),
      ),
    );
  }

  SizedBox _buildLoginButton(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          NavigatorController.instance.pushToPage(NavigateRoutesItems.login);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.entanRed.getColor(),
        ),
        child: Text(
          'Login',
          style: context.appGeneral.textTheme.titleMedium
              ?.copyWith(color: AppColor.white.getColor()), // Yazı rengi
        ),
      ),
    );
  }

  SizedBox _buildPageLogo() {
    return SizedBox(
      width: Get.width * 0.5, // Ekranın %50'si
      height: Get.width * 0.5, // Ekranın %50'si
      child: Image.asset(AppImageUtility.getImagePath("logo",
          format: ImageFormat.png)), // Logo dosyası
    );
  }
}

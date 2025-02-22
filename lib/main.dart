import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});
  final navigatorController = NavigatorController.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme(context).theme,
      initialRoute: NavigatorRoutes.init,
      getPages: NavigatorRoutes().routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

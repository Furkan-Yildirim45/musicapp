import 'package:flutter/material.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900], // Arka plan rengi
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Spacer(),
            SizedBox(
              width: 200, // Logo genişliği
              height: 200, // Logo yüksekliği
              child: Image.asset('assets/images/logo.png'), // Logo dosyası
            ),
            Spacer(),
            // Login butonu
            Column(
              children: [
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      NavigatorController.instance
                          .pushToPage(NavigateRoutesItems.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEF6B4A),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white), // Yazı rengi
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Butonlar arasında boşluk
                // Skip butonu
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      Colors.indigo[900],
                    ) // Arka plan rengi
                        ),
                    onPressed: () {
                      // Login butonuna tıklandığında yapılacak işlemler
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.white), // Yazı rengi
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

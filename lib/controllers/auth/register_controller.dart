import 'package:get/get.dart';
import 'package:main_app_structure/api/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';

class RegisterController extends GetxController {
  final AuthService _authService = AuthService();
  var isLoading = false.obs;

  Future<void> register(String email, String password) async {
    isLoading.value = true;
    User? user = await _authService.register(email, password);
    isLoading.value = false;

    if (user != null) {
      // Kayıt başarılı, ana sayfaya yönlendir
      Get.snackbar("Success", "Registerig process completed");
      NavigatorController.instance.pushAndRemoveUntil(NavigateRoutesItems.login);
    } else {
      // Hata durumunda kullanıcıya mesaj göster
      Get.snackbar("Error", "Registration failed. Please try again.");
    }
  }
} 
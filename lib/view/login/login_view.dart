import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/auth/login_controller.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.put(LoginController());
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Arka plan rengi
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              //logo
              Image.asset(
                "assets/images/logo.png",
                width: 64,
                height: 64,
              ),
              // Başlık
              const SizedBox(
                height: 70,
              ),
              const Text(
                'Welcome back!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              const Text(
                'Login to your account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              // E-posta alanı
              const Text(
                'E-mail',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                color: const Color(0xffF4F4FF),
                child: TextField(
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "john@mail.com",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 16),
                    hintStyle: context.appGeneral.textTheme.labelLarge
                        ?.copyWith(color: AppColor.grey.getColor()),
                    errorStyle: const TextStyle(height: 0),
                    counterText: '',
                    counterStyle: const TextStyle(height: 0),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 16),
              // Şifre alanı
              const Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                color: const Color(0xffF4F4FF),
                child: TextField(
                  controller: _passwordController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "********",
                    contentPadding: const EdgeInsets.only(left: 16),
                    border: InputBorder.none,
                    hintStyle: context.appGeneral.textTheme.labelLarge
                        ?.copyWith(color: AppColor.grey.getColor()),
                    errorStyle: const TextStyle(height: 0),
                    counterText: '',
                    counterStyle: const TextStyle(height: 0),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 16),
              // Remember Me ve Register
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text(
                        'Remember Me',
                        style: TextStyle(color: Color(0xff6251DD)),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      NavigatorController.instance.pushToPage(NavigateRoutesItems.register);
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Color(0xff6251DD)),
                    ),
                  ),
                ],
              ),
              // Login butonu
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              controller.login(_emailController.text, _passwordController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffEF6B4A),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

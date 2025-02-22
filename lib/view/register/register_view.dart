import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/auth/register_controller.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';

class RegisterView extends StatelessWidget {
   RegisterView({super.key});
  final RegisterController controller = Get.put(RegisterController());

  final TextEditingController _nameController = TextEditingController();
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
                'Welcome',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              const Text(
                'Register an account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              // E-posta alanı
              const Text(
                'Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                color: const Color(0xffF4F4FF),
                child: TextField(
                  controller: _nameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "John Doe",
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      NavigatorController.instance.pushToPage(NavigateRoutesItems.login);
                    },
                    child: const Text(
                      'Login',
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
              // Register butonuna tıklandığında register metodunu çağır
              controller.register(_emailController.text, _passwordController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffEF6B4A),
            ),
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

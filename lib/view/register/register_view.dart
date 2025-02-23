import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/auth/register_controller.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';
import 'package:main_app_structure/product/utils/app_utils/app_spaces..dart';
import 'package:main_app_structure/product/widgets/general/app_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final RegisterController controller = Get.put(RegisterController());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.getColor(), // Arka plan rengi
      body: SafeArea(
        child: Padding(
          padding: AppPadding.instance.horizontalMedium,
          child: ListView(
            children: [
              AppSpaces.instance.vertical40,
              // Logo
              _buildPageLogo(),
              AppSpaces.instance.vertical50,
              // Başlık
              _buildWelcomeText(context),
              _buildRegisterToYourAccountText(context),
              AppSpaces.instance.vertical30,
              // İsim alanı
              _buildNameTextFieldTopText(context),
              AppTextField(
                emailController: _nameController,
                hintText: "John Doe",
              ),
              AppSpaces.instance.vertical15,
              // E-posta alanı
              _buildEMailTextFieldTopText(context),
              AppTextField(
                emailController: _emailController,
                hintText: "john@gmail.com",
              ),
              AppSpaces.instance.vertical15,
              // Şifre alanı
              _buildPasswordTextFieldTopText(context),
              AppTextField(
                emailController: _passwordController,
                hintText: "********",
              ),
              AppSpaces.instance.vertical15,
              _buildLoginPageTo(),
              // Kayıt butonu
            ],
          ),
        ),
      ),
      floatingActionButton: _buildRegisterButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Row _buildLoginPageTo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            NavigatorController.instance.pushToPage(NavigateRoutesItems.login);
          },
          child: Text(
            'Login',
            style: TextStyle(color: AppColor.majorelleBlue.getColor()),
          ),
        ),
      ],
    );
  }

  SizedBox _buildPageLogo() {
    return SizedBox(
      width: Get.width * 0.16, // Ekranın %50'si
      height: Get.width * 0.16, // Ekranın %50'si
      child: Image.asset("assets/images/logo.png"), // Logo dosyası
    );
  }

  Text _buildWelcomeText(BuildContext context) {
    return const Text(
      'Welcome',
      style: TextStyle(fontSize: 16, color: Colors.black54),
    );
  }

  Text _buildNameTextFieldTopText(BuildContext context) {
    return const Text(
      'Name',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Text _buildEMailTextFieldTopText(BuildContext context) {
    return const Text(
      'E-mail',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Text _buildPasswordTextFieldTopText(BuildContext context) {
    return const Text(
      'Password',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Padding _buildRegisterButton(BuildContext context) {
    return Padding(
      padding: AppPadding.instance.horizontalMedium,
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            controller.register(
                _emailController.text, _passwordController.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.entanRed.getColor(),
          ),
          child: Text(
            'Register',
            style: context.appGeneral.textTheme.titleMedium
                ?.copyWith(color: AppColor.white.getColor()), // Yazı rengi
          ),
        ),
      ),
    );
  }

  Text _buildRegisterToYourAccountText(BuildContext context) {
    return Text(
      'Register an account',
      style: context.appGeneral.textTheme.headlineMedium?.copyWith(
          color: AppColor.black.getColor(), fontWeight: FontWeight.bold),
    );
  }
}

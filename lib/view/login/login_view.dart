import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app_structure/controllers/auth/login_controller.dart';
import 'package:main_app_structure/product/navigator/navigate_route_items.dart';
import 'package:main_app_structure/product/navigator/navigator_controller.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';
import 'package:main_app_structure/product/utils/app_utils/app_spaces..dart';
import 'package:main_app_structure/product/widgets/general/app_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.put(LoginController());
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
              //logo
              _buildPageLogo(),
              // Başlık
              AppSpaces.instance.vertical50,
              _buildWelcomeBackText(context),
              _buildLoginToYourAccountText(context),
              AppSpaces.instance.vertical30,
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
              // Remember Me ve Register
              _buildRememberMeAndRegisterPageTo(),
              // Login butonu
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildPageFloatActionButton(context),
    );
  }

  Padding _buildPageFloatActionButton(BuildContext context) {
    return Padding(
      padding: AppPadding.instance.horizontalMedium,
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            controller.login(_emailController.text, _passwordController.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.entanRed.getColor(),
          ),
          child: Text(
            'Login',
            style: context.appGeneral.textTheme.titleMedium
                ?.copyWith(color: AppColor.white.getColor()),
          ),
        ),
      ),
    );
  }

  Row _buildRememberMeAndRegisterPageTo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text(
              'Remember Me',
              style: TextStyle(color: AppColor.majorelleBlue.getColor()),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            NavigatorController.instance
                .pushToPage(NavigateRoutesItems.register);
          },
          child: Text(
            'Register',
            style: TextStyle(color: AppColor.majorelleBlue.getColor()),
          ),
        ),
      ],
    );
  }

  Text _buildPasswordTextFieldTopText(BuildContext context) {
    return Text(
      'Password',
      style: context.appGeneral.textTheme.bodyLarge
          ?.copyWith(color: AppColor.black.getColor()),
    );
  }

  Text _buildEMailTextFieldTopText(BuildContext context) {
    return Text(
      'E-mail',
      style: context.appGeneral.textTheme.bodyLarge
          ?.copyWith(color: AppColor.black.getColor()),
    );
  }

  Text _buildLoginToYourAccountText(BuildContext context) {
    return Text(
      'Login to your account',
      style: context.appGeneral.textTheme.headlineMedium?.copyWith(
          color: AppColor.black.getColor(), fontWeight: FontWeight.bold),
    );
  }

  Text _buildWelcomeBackText(BuildContext context) {
    return Text(
      'Welcome back!',
      style: context.appGeneral.textTheme.bodyLarge
          ?.copyWith(color: AppColor.black54.getColor()),
    );
  }

  Image _buildPageLogo() {
    return Image.asset(
      "assets/images/logo.png",
      width: Get.height * 0.1,
      height: Get.height * 0.1,
    );
  }
}


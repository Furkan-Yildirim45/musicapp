import 'package:flutter/material.dart';
import 'package:main_app_structure/product/utils/app_utils/app_colors.dart';
import 'package:main_app_structure/product/utils/app_utils/app_general.dart';
import 'package:main_app_structure/product/utils/app_utils/app_padding.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required TextEditingController emailController,
    required this.hintText,
  }) : controller = emailController;

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.maWhite.getColor(),
      child: TextField(
        controller: controller,
        cursorColor: AppColor.black.getColor(),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: AppPadding.instance.leftMedium,
          hintStyle: context.appGeneral.textTheme.labelLarge
              ?.copyWith(color: AppColor.grey.getColor()),
          errorStyle: const TextStyle(height: 0),
          counterText: '',
          counterStyle: const TextStyle(height: 0),
        ),
        keyboardType: TextInputType.emailAddress,
        maxLines: 1,
      ),
    );
  }
}

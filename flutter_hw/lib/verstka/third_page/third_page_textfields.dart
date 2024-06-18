import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';
import 'package:flutter_hw/verstka/widgets/main_textfield.dart';

class ThirdPageTextFields extends StatelessWidget {
  const ThirdPageTextFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainTextField(
          style: AppTextStyles.s18w400,
          controller: nameController,
          labelText: 'Enter your full name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter please correctly';
            }
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 29,
        ),
        MainTextField(
          style: AppTextStyles.s18w400,
          controller: emailController,
          labelText: 'Enter your email',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter please correctly';
            }
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 29,
        ),
        MainTextField(
          style: AppTextStyles.s18w400,
          controller: passwordController,
          labelText: 'Enter your password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter please correctly';
            }
            if (passwordController.text != confirmPasswordController.text) {
              return 'Passwords doesnt match';
            }
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 29,
        ),
        MainTextField(
          style: AppTextStyles.s18w400,
          controller: confirmPasswordController,
          labelText: 'Confirm password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter please correctly';
            }
            if (passwordController.text != confirmPasswordController.text) {
              return 'Passwords doesnt match';
            }
            return null;
          },
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 58,
        ),
      ],
    );
  }
}

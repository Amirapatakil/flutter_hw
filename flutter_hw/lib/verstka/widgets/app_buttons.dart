import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_colors.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    super.key,
    required this.text,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.appButttonPadding,
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.homescreenButton,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.s24w800.copyWith(
            color: AppColors.ButtonText,
          ),
        ),
      ),
    );
  }
}

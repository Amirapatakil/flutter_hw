import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_colors.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';

class MainElevatedButton extends StatefulWidget {
  const MainElevatedButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  State<MainElevatedButton> createState() => _MainElevatedButtonState();
}

class _MainElevatedButtonState extends State<MainElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.secondPageTextFieldAndElB,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.homescreenButton),
          onPressed: widget.onPressed,
          child: Text(
            'Continue',
            style: AppTextStyles.s24w800.copyWith(color: AppColors.ButtonText),
          ),
        ),
      ),
    );
  }
}

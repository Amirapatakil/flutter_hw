import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';

class ThirdPageText extends StatelessWidget {
  const ThirdPageText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'SIGN UP',
          style: AppTextStyles.s24w500,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          textAlign: TextAlign.center,
          'Just entry your personal details',
          style: AppTextStyles.s16w500,
        ),
        SizedBox(
          height: 29,
        ),
      ],
    );
  }
}

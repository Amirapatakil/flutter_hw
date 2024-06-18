import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';
import 'package:flutter_hw/verstka/screens/third_page.dart';

class SecondPageText extends StatelessWidget {
  const SecondPageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.secondPageTextPadding,
      ),
      child: Column(
        children: [
          const Text(
            'Welcome Onbord!',
            style: AppTextStyles.s24w500,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Let’s help you meet up your best tenant or landlord',
            style: AppTextStyles.s16w500,
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ThitdPage()));
            },
            child: const Text(
              'Log in or sign up',
              style: AppTextStyles.s18w500,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

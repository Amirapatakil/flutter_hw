import 'package:flutter/material.dart';
import 'package:flutter_hw/app_assets.dart';
import 'package:flutter_hw/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_colors.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';
import 'package:flutter_hw/verstka/widgets/app_buttons.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            left: AppDimens.homeScreenCirclePadding,
            top: AppDimens.homeScreenCirclePadding,
            child: Container(
              width: AppDimens.homeScreenCircleRadius,
              height: AppDimens.homeScreenCircleRadius,
              decoration: const BoxDecoration(
                color: AppColors.homeSreenCircle,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 130),
                child: Column(
                  children: [
                    Image.asset(AppAssets.homeScreenImage),
                    Text(
                      'Choose Your BEST & SMART House',
                      style: AppTextStyles.s24w700.copyWith(
                        color: AppColors.homeSreenMainText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'I am a',
                      style: AppTextStyles.s20w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppButton(
                      onPressed: () {},
                      text: 'Tenant',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'I am a',
                      style: AppTextStyles.s20w400,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    AppButton(
                      onPressed: () {},
                      text: 'Landlord',
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

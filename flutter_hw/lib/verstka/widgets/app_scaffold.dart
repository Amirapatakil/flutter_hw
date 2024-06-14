import 'package:flutter/material.dart';
import 'package:flutter_hw/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_colors.dart';
import 'package:flutter_hw/verstka/screens/first_page.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.isBackButtonVisible = false,
  });
  final Widget child;
  final bool isBackButtonVisible;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
            Visibility(
              visible: isBackButtonVisible,
              child: Positioned(
                top: AppDimens.backArrowPadding,
                left: AppDimens.backArrowPadding,
                child: SizedBox(
                  width: AppDimens.homeScreenCircleRadius,
                  height: AppDimens.homeScreenCircleRadius,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FirstPage()));
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                      color: AppColors.backArrow,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

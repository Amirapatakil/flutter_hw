import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.isBackButtonVisible = false,
    required this.onTap,
  });
  final Widget child;
  final bool isBackButtonVisible;
  final void Function()? onTap;
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
                    onTap: onTap,
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

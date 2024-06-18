import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_assets.dart';

class SecondPageImages extends StatelessWidget {
  const SecondPageImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(AppAssets.group3),
      const SizedBox(
        width: 100,
      ),
      Image.asset(AppAssets.group2),
    ]);
  }
}

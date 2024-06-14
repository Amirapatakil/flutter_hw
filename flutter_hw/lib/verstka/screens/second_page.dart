import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hw/app_assets.dart';
import 'package:flutter_hw/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';
import 'package:flutter_hw/verstka/widgets/app_scaffold.dart';
import 'package:flutter_hw/verstka/widgets/second_page_ele_button.dart';
import 'package:flutter_hw/verstka/widgets/second_page_text.dart';
import 'package:flutter_hw/verstka/widgets/second_page_textfield.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final secondPageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBackButtonVisible: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120),
        child: Column(
          children: [
            const SecondPageText(),
            SecondPageTextField(
              style: AppTextStyles.s18w400,
              controller: secondPageController,
              labelText: 'Enter your phone number',
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(
              height: 26,
            ),
            const SecondPageElevatedButton(),
            const SizedBox(
              height: 26,
            ),
            const Text(
              'or',
              style: AppTextStyles.s18w500,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(AppAssets.group3),
              const SizedBox(
                width: 100,
              ),
              Image.asset(AppAssets.group2),
            ]),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.secondPageBottomTextPadding,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'By continuing, you agree to our Terms of Service Privacy Policy Content Policy',
                style: AppTextStyles.s16w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

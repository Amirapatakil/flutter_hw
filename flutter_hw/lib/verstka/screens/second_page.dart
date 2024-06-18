import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_dimens.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';
import 'package:flutter_hw/verstka/screens/first_page.dart';
import 'package:flutter_hw/verstka/widgets/app_scaffold.dart';
import 'package:flutter_hw/verstka/widgets/main_ele_button.dart';
import 'package:flutter_hw/verstka/screens/fourh_page.dart';
import 'package:flutter_hw/verstka/second_page/second_page_image.dart';
import 'package:flutter_hw/verstka/second_page/second_page_text.dart';
import 'package:flutter_hw/verstka/widgets/main_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final secondPageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final SharedPreferences prefs;

  initprefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    initprefs();
  }

  @override
  void dispose() {
    secondPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBackButtonVisible: true,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FirstPage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SecondPageText(),
              MainTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter please correctlyy';
                  }
                  return null;
                },
                style: AppTextStyles.s18w400,
                controller: secondPageController,
                labelText: 'Enter your name',
              ),
              const SizedBox(
                height: 26,
              ),
              MainElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String? name = prefs.getString('username');
                    if (name != secondPageController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'You are not registered\nClick on Log in or sign up')),
                      );
                    }
                    if (name == secondPageController.text) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FourPage(),
                          ));
                    }
                  }
                },
              ),
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
              const SecondPageImages(),
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
      ),
    );
  }
}

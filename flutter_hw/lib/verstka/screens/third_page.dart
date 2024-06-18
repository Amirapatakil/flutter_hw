import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/app_theme/app_text_styles.dart';
import 'package:flutter_hw/verstka/screens/second_page.dart';
import 'package:flutter_hw/verstka/third_page/third_page_textfields.dart';
import 'package:flutter_hw/verstka/widgets/app_scaffold.dart';
import 'package:flutter_hw/verstka/widgets/main_ele_button.dart';
import 'package:flutter_hw/verstka/widgets/main_textfield.dart';
import 'package:flutter_hw/verstka/third_page/third_page_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThitdPage extends StatefulWidget {
  const ThitdPage({super.key});

  @override
  State<ThitdPage> createState() => _ThitdPageState();
}

class _ThitdPageState extends State<ThitdPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late SharedPreferences prefs;
  late String _username;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initprefs();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  initprefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBackButtonVisible: true,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondPage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const ThirdPageText(),
              ThirdPageTextFields(
                nameController: nameController,
                passwordController: passwordController,
                emailController: emailController,
                confirmPasswordController: confirmPasswordController,
              ),
              MainElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _username = nameController.text;
                    prefs.setString('username', _username);
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('You registered now')),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hw/practice_07_june.dart/screens/registration_screen.dart';
import 'package:flutter_hw/practice_07_june.dart/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreens extends StatefulWidget {
  const FirstScreens({super.key});
  @override
  State<FirstScreens> createState() => _FirstScreensState();
}

class _FirstScreensState extends State<FirstScreens> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController1 = TextEditingController();
  final _passwordController1 = TextEditingController();
  late final SharedPreferences prefs;

  @override
  void dispose() {
    _phoneController1.dispose();
    _passwordController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppTextFormField(
                validator: (value1) {
                  if (value1 == null || value1.isEmpty) {
                    return 'Enter please correctly';
                  }
                  if (!value1.contains('+996')) {
                    return 'Enter with code +996';
                  }
                  if (value1.length > 13) {
                    return 'Enter please correctly';
                  }
                  return null;
                },
                controller: _phoneController1,
                labelText: 'Enter your phone',
                hintText: '+996',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                validator: (value2) {
                  if (value2 == null || value2.isEmpty) {
                    return 'Enter please correctly';
                  }
                  return null;
                },
                controller: _passwordController1,
                labelText: 'Enter your password',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                  child: const Text('Sign in')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()));
                  },
                  child: const Text('Sign up'))
            ]),
          ),
        ));
  }
}

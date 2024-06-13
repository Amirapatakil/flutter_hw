import 'package:flutter/material.dart';
import 'package:flutter_hw/practice_07_june.dart/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  late final SharedPreferences prefs;
  bool visibly = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  register() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(_phoneController.text, _passwordController2.text);
  }

  @override
  void initState() {
    register();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                controller: _phoneController,
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
                controller: _passwordController,
                labelText: 'Enter your password',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                validator: (value2) {
                  if (value2 == null || value2.isEmpty) {
                    return 'Enter please correctly';
                  }
                  if (value2 != _passwordController.text) {
                    return 'Passwords do not match';
                  }

                  return null;
                },
                controller: _passwordController2,
                labelText: 'Enter your password one more time',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      visibly = true;
                    });
                  } else {
                    setState(() {
                      visibly = false;
                    });
                  }
                },
                child: const Text('Sign up'),
              ),
              if (visibly)
                const Text(
                  'Registration successfully done!',
                  style: TextStyle(color: Colors.black),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

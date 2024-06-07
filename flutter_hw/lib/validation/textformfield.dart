import 'package:flutter/material.dart';
import 'package:flutter_hw/validation/app_text_form_field.dart';

class TextfieldValidation extends StatefulWidget {
  const TextfieldValidation({super.key});

  @override
  State<TextfieldValidation> createState() => _TextfieldValidationState();
}

class _TextfieldValidationState extends State<TextfieldValidation> {
  final _namecontroller = TextEditingController();
  final _surnamecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _gendercontroller = TextEditingController();
  bool _isMarried = true;
  final _femaleNameController = TextEditingController();
  final _homeController = TextEditingController();
  final _workController = TextEditingController();
  final _educationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _namecontroller.dispose();
    _surnamecontroller.dispose();
    _agecontroller.dispose();
    _gendercontroller.dispose();
    _femaleNameController.dispose();
    _homeController.dispose();
    _workController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          AppTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Name';
                              }
                              return null;
                            },
                            labelText: 'Enter your Name',
                            controller: _namecontroller,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Surname';
                              }
                              return null;
                            },
                            labelText: 'Enter your Surname',
                            controller: _surnamecontroller,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your age';
                              }
                              final age = int.tryParse(value);
                              if (age! < 18) {
                                return 'You must be at least 18 years old';
                              }
                              return null;
                            },
                            labelText: 'Enter your age',
                            controller: _agecontroller,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your gender';
                              }
                              String gender = value;
                              if (gender.toUpperCase() != 'M' &&
                                  gender.toUpperCase() != 'F') {
                                return 'You need enter M or F';
                              }

                              return null;
                            },
                            labelText: 'Enter your gender',
                            controller: _gendercontroller,
                            hintText: 'Text M or F',
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SwitchListTile(
                            title: const Text('Married'),
                            value: _isMarried,
                            onChanged: (value) {
                              setState(() {
                                _isMarried = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (_isMarried == true &&
                              _gendercontroller.toString() ==
                                  'F') // дополнительное задание
                            AppTextFormField(
                              controller: _femaleNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your  mothers Surname';
                                }
                                return null;
                              },
                              labelText: 'Enter your mothers Surname',
                              keyboardType: TextInputType.name,
                            ),
                          AppTextFormField(
                            controller: _workController,
                            labelText: 'Enter your work',
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextFormField(
                            controller: _educationController,
                            labelText: 'Enter your education',
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextFormField(
                            controller: _homeController,
                            labelText: 'Enter your work',
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _formKey.currentState?.validate();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue.shade900, // Цвет фона кнопки
                              foregroundColor:
                                  Colors.green.shade400, // Цвет текста кнопки
                              shadowColor: Colors.black, // Цвет тени
                              elevation: 3, // Величина тени
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Validate'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

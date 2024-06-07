import 'package:flutter/material.dart';
import 'package:flutter_hw/validation/textformfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      title: 'Flutter Demo',
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextfieldValidation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_dimens.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    required this.controller,
    this.validator,
    required this.labelText,
    this.keyboardType,
    required this.style,
    super.key,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextStyle style;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.secondPageTextFieldAndElB,
      ),
      child: TextFormField(
        style: widget.style,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.labelText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}

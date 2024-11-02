import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final bool? readOnly;
  final String? Function(String?)? validator;

  const BaseTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          readOnly: readOnly!,
          style: TextStyle(
            color: readOnly! ? Colors.black54 : Colors.black,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            filled: true,
            fillColor: readOnly! ? Colors.grey[200] : Colors.white,
          ),
          validator: validator,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class EmailInput extends FormField<String> {
  final TextEditingController controller;
  final BoxConstraints? constraints;
  final String labelText;

  // https://medium.com/saugo360/creating-custom-form-fields-in-flutter-85a8f46c2f41
  EmailInput({
    super.key,
    super.enabled,
    required this.controller,
    this.constraints,
    this.labelText = "Email",
  }) : super(
          builder: (field) {
            return TextFormField(
              enabled: enabled,
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email address. Ex. testemail@hotmail.com';
                }

                var emailRegex = RegExp(r'\w+@\w+\.\w');
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter email in the form "testemail@hotmail.com"';
                }

                return null;
              },
              decoration: InputDecoration(
                labelText: labelText,
                constraints: constraints,
                border: const OutlineInputBorder(),
              ),
            );
          },
        );
}

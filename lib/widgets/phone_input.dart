import 'package:flutter/material.dart';

import '../data/validators.dart';

class PhoneInput extends FormField<String> {
  final TextEditingController controller;
  final BoxConstraints? constraints;
  final String labelText;

  PhoneInput({
    super.key,
    super.enabled,
    required this.controller,
    this.constraints,
    this.labelText = "Phone",
  }) : super(builder: (field) {
          return TextFormField(
            controller: controller,
            validator: (value) => Validators.validatePhone(value),
            onChanged: (value) {
              if (value.length == 3) {
                controller.value = TextEditingValue(
                    text: '($value) ', selection: const TextSelection.collapsed(offset: 6));
              } else if (value.length == 9) {
                controller.value = TextEditingValue(
                    text: '$value-', selection: const TextSelection.collapsed(offset: 10));
              }
            },
            decoration: InputDecoration(
              labelText: labelText,
              constraints: constraints,
              border: const OutlineInputBorder(),
              enabled: enabled,
            ),
          );
        });
}

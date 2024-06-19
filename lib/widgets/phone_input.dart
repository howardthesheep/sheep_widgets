import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/validators.dart';

class PhoneInput extends FormField<String> {
  final TextEditingController controller;
  final BoxConstraints? constraints;
  final String labelText;
  final Function(String)? onChanged;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;

  PhoneInput({
    super.key,
    super.enabled,
    super.autovalidateMode,
    super.initialValue,
    super.onSaved,
    super.validator,
    required this.controller,
    this.constraints,
    this.labelText = "Phone",
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
  }) : super(builder: (field) {
          return TextFormField(
            controller: controller,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            readOnly: readOnly,
            inputFormatters: inputFormatters,
            validator: validator ?? (value) => Validators.validatePhone(value),
            onChanged: onChanged ??
                (value) {
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
              prefix: prefix,
              prefixIcon: prefixIcon,
              suffix: suffix,
              suffixIcon: suffixIcon,
            ),
          );
        });
}

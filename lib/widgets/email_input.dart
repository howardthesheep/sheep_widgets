import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailInput extends FormField<String> {
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

  EmailInput({
    super.key,
    super.enabled,
    super.autovalidateMode,
    super.initialValue,
    super.onSaved,
    super.validator,
    required this.controller,
    this.constraints,
    this.labelText = "Email",
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
  }) : super(
          builder: (field) {
            return TextFormField(
              enabled: enabled,
              autovalidateMode: autovalidateMode,
              initialValue: initialValue,
              controller: controller,
              readOnly: readOnly,
              onChanged: onChanged,
              inputFormatters: inputFormatters,
              validator: validator ??
                  (value) {
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
                  prefix: prefix,
                  prefixIcon: prefixIcon,
                  suffix: suffix,
                  suffixIcon: suffixIcon),
            );
          },
        );
}

import 'package:flutter/material.dart';

import '../../data/validators.dart';
import 'email_input.dart';
import 'phone_input.dart';

// TODO: Refactor to extend FormField<String> like has been done in email_input.dart
class ContactInfoInput extends StatefulWidget {
  final String nameText;
  final TextEditingController nameCont;
  final String emailText;
  final TextEditingController emailCont;
  final String phoneText;
  final TextEditingController phoneCont;
  final bool reviewable;

  const ContactInfoInput({
    super.key,
    this.reviewable = false,
    required this.nameText,
    required this.nameCont,
    required this.emailText,
    required this.emailCont,
    required this.phoneText,
    required this.phoneCont,
  });

  @override
  State<ContactInfoInput> createState() => _ContactInfoInputState();
}

class _ContactInfoInputState extends State<ContactInfoInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: TextFormField(
            controller: widget.nameCont,
            validator: Validators.validateFullname,
            decoration: InputDecoration(
              labelText: widget.nameText,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: EmailInput(
            controller: widget.emailCont,
            labelText: widget.emailText,
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: PhoneInput(
            controller: widget.phoneCont,
            labelText: widget.phoneText,
          ),
        ),
      ],
    );
  }
}

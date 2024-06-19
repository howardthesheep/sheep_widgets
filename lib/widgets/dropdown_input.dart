import 'package:flutter/material.dart';

class DropdownInput extends FormField<String> {
  final String prompt;
  final BuildContext context;
  final TextEditingController? controller;
  final Function(String?)? onSelected;

  DropdownInput(
      {super.key, required this.context, this.prompt = '', this.controller, this.onSelected})
      : super(
          builder: (field) {
            var theme = Theme.of(context);

            return Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prompt,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 18,
                      color: theme.textTheme.headlineSmall?.color,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  DropdownMenu(
                    controller: controller ?? TextEditingController(),
                    initialSelection: 'No',
                    onSelected: onSelected,
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'No', label: 'No'),
                      DropdownMenuEntry(value: 'Yes', label: 'Yes'),
                    ],
                  ),
                ],
              ),
            );
          },
        );
}

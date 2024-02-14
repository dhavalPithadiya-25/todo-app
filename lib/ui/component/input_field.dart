import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/app/extensions/context_extension.dart';
import 'package:todo_app/app/resources/resources.dart';

class CommonInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String> validator;
  final String? title;

  const CommonInputField({super.key, required this.controller, required this.label, required this.validator, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text("$title"),
          const Gap(Spacing.small),
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: context.theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
          validator: validator,
          controller: controller,
          decoration: InputDecoration(hintText: label),
        ),
      ],
    );
  }
}

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;

  const EmailInputField({super.key, required this.controller, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text("$title"),
          const Gap(Spacing.small),
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: context.theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter your email"),
        ),
      ],
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String label;

  const PasswordInputField({super.key, required this.controller, this.title, required this.label});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final ValueNotifier<bool> _isVisiblePassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text("${widget.title}"),
          const Gap(Spacing.small),
        ],
        ValueListenableBuilder(
          valueListenable: _isVisiblePassword,
          builder: (context, value, child) {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: !_isVisiblePassword.value,
              style: context.theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.label,
                suffixIcon: IconButton(
                  onPressed: () => _isVisiblePassword.value = !_isVisiblePassword.value,
                  icon: Icon(value ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

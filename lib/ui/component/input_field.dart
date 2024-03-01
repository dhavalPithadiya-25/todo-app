import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app/app/extensions/context_extension.dart';
import 'package:todo_app/app/resources/resources.dart';
import 'package:todo_app/utils/validators.dart';

class _TextFormField extends StatelessWidget {
  const _TextFormField({
    required this.controller,
    this.title,
    required this.hintText,
    required this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputType,
    this.textInputAction,
    this.autofillHints,
  });

  final TextEditingController controller;
  final String? title;
  final String hintText;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          Text("$title"),
          const Gap(Spacing.small),
        ],
        TextFormField(
          autofillHints: autofillHints,
          onTapOutside: (event) => _hideKeyboard(context),
          textInputAction: textInputAction,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: context.theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
          validator: validator,
          controller: controller,
          decoration: InputDecoration(suffixIcon: suffixIcon, hintText: hintText, errorMaxLines: 3),
        ),
      ],
    );
  }

  void _hideKeyboard(BuildContext context) {
    final FocusScopeNode focusScope = FocusScope.of(context);
    if (focusScope.hasFocus) focusScope.unfocus();
  }
}

class CommonInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final String? title;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;

  const CommonInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.title,
    this.textInputAction,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return _TextFormField(
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      controller: controller,
      hintText: hintText,
      validator: validator,
      title: title,
    );
  }
}

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final TextInputAction? textInputAction;

  const EmailInputField({super.key, required this.controller, this.title, this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return _TextFormField(
      autofillHints: const [AutofillHints.email],
      title: title,
      controller: controller,
      hintText: "Enter your email address",
      validator: Validator.emailValidation,
      textInputAction: textInputAction,
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;

  const PasswordInputField({
    super.key,
    required this.controller,
    this.title,
    required this.hintText,
    required this.validator,
    this.textInputAction,
    this.autofillHints,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final ValueNotifier<bool> _isVisiblePassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isVisiblePassword,
      builder: (context, value, child) {
        return _TextFormField(
          autofillHints: widget.autofillHints,
          textInputAction: widget.textInputAction,
          title: widget.title,
          controller: widget.controller,
          hintText: widget.hintText,
          validator: widget.validator,
          obscureText: !_isVisiblePassword.value,
          suffixIcon: IconButton(
            onPressed: () => _isVisiblePassword.value = !_isVisiblePassword.value,
            icon: Icon(value ? Icons.visibility : Icons.visibility_off),
          ),
        );
      },
    );
  }
}

class OtpInputField extends StatelessWidget {
  const OtpInputField({
    super.key,
    required this.controller,
    this.error,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? error;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final decoration = PinTheme(
      textStyle: TextStyle(fontSize: 18, color: colorScheme.onSurface, fontWeight: FontWeight.w500),
      constraints: const BoxConstraints(minWidth: 64, minHeight: 48),
      decoration: BoxDecoration(
        borderRadius: ShapeBorderRadius.small,
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline, width: 1),
      ),
    );
    return Pinput(
      errorTextStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: colorScheme.error),
      errorText: error,
      onChanged: onChanged,
      autofillHints: const {AutofillHints.oneTimeCode},
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      closeKeyboardWhenCompleted: true,
      pinAnimationType: PinAnimationType.scale,
      submittedPinTheme: decoration.copyBorderWith(border: Border.all(color: colorScheme.primary, width: 1.5)),
      errorPinTheme: decoration.copyBorderWith(border: Border.all(color: colorScheme.error, width: 1.5)),
      focusedPinTheme: decoration.copyBorderWith(border: Border.all(color: colorScheme.primary, width: 1.5)),
      autofocus: false,
      length: 6,
      controller: controller,
      defaultPinTheme: decoration,
      forceErrorState: error != null,
    );
  }
}

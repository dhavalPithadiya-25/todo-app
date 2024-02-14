import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/app/resources/resources.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        const Gap(Spacing.small),
        Text(text),
        const Gap(Spacing.small),
        const Expanded(child: Divider()),
      ],
    );
  }
}

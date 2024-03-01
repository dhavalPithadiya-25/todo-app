import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/extensions/context_extension.dart';

class LinkTextSpan extends TextSpan {
  final VoidCallback? onPressed;
  final bool hasUnderLine;

  const LinkTextSpan({
    required super.text,
    super.style,
    this.onPressed,
    this.hasUnderLine = false,
  });
}

class LinkText extends StatelessWidget {
  final List<TextSpan> listSpan;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LinkText({
    super.key,
    required this.listSpan,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Text.rich(
      TextSpan(
        children: listSpan.map((span) {
          if (span is LinkTextSpan && span.onPressed != null) {
            return TextSpan(
              text: span.text,
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
                decoration: (span.hasUnderLine) ? TextDecoration.underline : TextDecoration.none,
                decorationColor: colorScheme.primary,
              ),
              recognizer: TapGestureRecognizer()..onTap = span.onPressed,
            );
          } else {
            return span;
          }
        }).toList(),
      ),
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: colorScheme.onSurfaceVariant).merge(style),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}

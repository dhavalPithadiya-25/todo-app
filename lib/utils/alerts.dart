import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:todo_app/app/extensions/context_extension.dart';

class AlertMessage extends SnackBar {
  AlertMessage({
    super.key,
    required String title,
    required String? description,
    required Color? backgroundColor,
    required Color? foregroundColor,
    super.duration,
  }) : super(
          content: _AlertMessageContent(
            key: UniqueKey(),
            title: title,
            description: description,
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
          ),
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          padding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          dismissDirection: DismissDirection.horizontal,
          behavior: SnackBarBehavior.floating,
        );
}

class _AlertMessageContent extends StatelessWidget {
  final String title;
  final String? description;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const _AlertMessageContent({
    super.key,
    required this.title,
    required this.description,
    required this.foregroundColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final snackBarTheme = theme.snackBarTheme;
    final foregroundColor = this.foregroundColor ?? snackBarTheme.contentTextStyle?.color ?? colorScheme.onBackground;

    return Material(
      shape: snackBarTheme.shape,
      clipBehavior: Clip.hardEdge,
      color: colorScheme.background,
      child: Material(
        shape: snackBarTheme.shape,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 16, 8),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: foregroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: foregroundColor),
                      ),
                      if (description != null && description!.isNotEmpty)
                        Text(
                          description!,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: foregroundColor),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void showSuccessMessage({required BuildContext context, required String title, String? content}) {
  ScaffoldMessenger.of(context).showSnackBar(AlertMessage(
    title: title,
    description: content,
    backgroundColor: Colors.green.shade300,
    foregroundColor: Colors.green,
  ));
}

void showErrorMessage({required BuildContext context, required String title, String? content}) {
  ScaffoldMessenger.of(context).showSnackBar(AlertMessage(
    title: title,
    description: content,
    backgroundColor: context.colorScheme.onErrorContainer,
    foregroundColor: context.colorScheme.error,
  ));
}

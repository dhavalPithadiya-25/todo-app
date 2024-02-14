import 'package:flutter/material.dart';




enum _ButtonType { filled }

class _Button extends StatelessWidget {
  const _Button({
    required this.type,
    required this.onTap,
    required this.label,
    required this.primary,
    required this.onPrimary,
    this.dense = false,
  });

  final _ButtonType type;
  final VoidCallback onTap;
  final String label;
  final Color primary;
  final Color onPrimary;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    Widget child = Text(label, textAlign: TextAlign.center);

    if (!dense) child = Center(heightFactor: 1.0, child: child);
    final tapTargetSize = dense ? MaterialTapTargetSize.shrinkWrap : null;
    final VisualDensity? visualDensity = dense ? VisualDensity.compact : null;

    return switch (type) {
      _ButtonType.filled => FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: onPrimary,
            visualDensity: visualDensity,
            tapTargetSize: tapTargetSize,
          ),
          onPressed: onTap,
          child: child,
        ),
    };
  }
}

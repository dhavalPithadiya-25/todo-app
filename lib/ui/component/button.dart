import 'package:flutter/material.dart';
import 'package:todo_app/app/resources/resources.dart';

enum _ButtonType { filled, outlined, icon, outlinedIcon }

class _Button extends StatelessWidget {
  final String label;
  final _ButtonType type;
  final String? icon;
  final VoidCallback? onPressed;

  const _Button({
    super.key,
    required this.label,
    required this.onPressed,
    required this.type,
    this.icon,
  });

  ButtonStyle get _buttonStyle {
    return switch (type) {
      _ButtonType.filled || _ButtonType.icon || _ButtonType.outlinedIcon => FilledButton.styleFrom(elevation: 0),
      _ButtonType.outlined => OutlinedButton.styleFrom(elevation: 0),
    };
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Text(label, textAlign: TextAlign.center);
    return switch (type) {
      _ButtonType.filled => FilledButton(onPressed: onPressed, style: _buttonStyle, child: child),
      _ButtonType.outlined => OutlinedButton(onPressed: onPressed, style: _buttonStyle, child: child),
      _ButtonType.icon => FilledButton.icon(
          onPressed: onPressed,
          icon: SizedBox.square(
            dimension: 24,
            child: Image.asset(icon!),
          ),
          label: child,
          style: _buttonStyle,
        ),
      _ButtonType.outlinedIcon => OutlinedButton.icon(
          onPressed: onPressed,
          icon: SizedBox.square(
            dimension: 24,
            child: Image.asset(icon!),
          ),
          label: child,
          style: _buttonStyle,
        )
    };
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final String? _icon;
  final VoidCallback? onPressed;
  final _ButtonType _type;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  })  : _icon = null,
        _type = _ButtonType.filled;

  const PrimaryButton.outlined({
    super.key,
    required this.label,
    required this.onPressed,
  })  : _icon = null,
        _type = _ButtonType.outlined;

  const PrimaryButton.icon({
    super.key,
    required this.label,
    required String icon,
    required this.onPressed,
  })  : _icon = icon,
        _type = _ButtonType.icon;

  const PrimaryButton.outlinedIcon({
    super.key,
    required this.label,
    required String icon,
    required this.onPressed,
  })  : _icon = icon,
        _type = _ButtonType.outlinedIcon;

  @override
  Widget build(BuildContext context) {
    return _Button(label: label, icon: _icon, onPressed: onPressed, type: _type);
  }
}

class BottomPersistenceBar extends StatelessWidget {
  final List<Widget> children;

  const BottomPersistenceBar({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(Spacing.normal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class BottomPersistenceButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const BottomPersistenceButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(Spacing.normal),
      child: PrimaryButton(label: label, onPressed: onPressed),
    );
  }
}

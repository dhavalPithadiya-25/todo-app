import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/app/extensions/context_extension.dart';
import 'package:todo_app/app/resources/resources.dart';

class AuthLayout extends StatelessWidget {
  final Widget content;
  final Widget? bottom;
  final bool hasBackButton;
  final String title;

  const AuthLayout({
    super.key,
    this.bottom,
    this.hasBackButton = true,
    required this.content,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: _AuthHeaderDelegate(minHeight: 160, maxHeight: 180 + context.topPadding, hasBackButton: hasBackButton, title: title),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(Spacing.normal),
            sliver: SliverToBoxAdapter(child: content),
          )
        ],
      ),
      bottomNavigationBar: bottom,
    );
  }
}

class _AuthHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _AuthHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.title,
    this.hasBackButton = true,
  });

  final double minHeight;
  final double maxHeight;
  final bool hasBackButton;
  final String title;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => OverScrollHeaderStretchConfiguration();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final color = context.colorScheme;
    final textTheme = context.theme.textTheme;
    final overlayStyle = _systemOverlayStyleForBrightness(
      ThemeData.estimateBrightnessForColor(color.primary),
      context.theme.useMaterial3 ? const Color(0x00000000) : null,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Material(
        color: color.primary,
        child: IconTheme.merge(
          data: IconThemeData(color: context.colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.normal),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasBackButton) const BackButton(),
                  const Spacer(),
                  Text(title, style: textTheme.displaySmall?.copyWith(color: color.onPrimary)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
  }

  SystemUiOverlayStyle _systemOverlayStyleForBrightness(Brightness brightness, [Color? backgroundColor]) {
    final SystemUiOverlayStyle style = brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
    return SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarBrightness: style.statusBarBrightness,
      statusBarIconBrightness: style.statusBarIconBrightness,
      systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
    );
  }
}

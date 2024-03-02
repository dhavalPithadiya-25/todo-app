import 'package:flutter/material.dart';
import 'package:todo_app/app/resources/resources.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Center(
        child: SizedBox.square(
          dimension: 84,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.normal),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(Spacing.normal),
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}

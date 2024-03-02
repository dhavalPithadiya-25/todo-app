import 'package:flutter/material.dart';
import 'package:todo_app/app/extensions/context_extension.dart';
import 'package:todo_app/ui/component/loading.dart';

class LoadingHandler {
  final BuildContext _context;
  Route? _dialogRoute;

  LoadingHandler({
    required BuildContext context,
  }) : _context = context;

  Route _buildDialogRoute(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final CapturedThemes themes = InheritedTheme.capture(from: context, to: Navigator.of(context).context);
    return DialogRoute(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      settings: const RouteSettings(name: "/loading_dialog"),
      themes: themes,
      builder: (context) => const LoadingDialog(),
    );
  }

  void handleLoading(bool loading) {
    if (loading) {
      startLoading();
    } else {
      stopLoading();
    }
  }

  void startLoading() {
    if (_dialogRoute != null) return;
    _dialogRoute = _buildDialogRoute(_context);
    _context.navigator.push(_dialogRoute!);
  }

  void stopLoading() {
    if (_dialogRoute != null) _context.navigator.removeRoute(_dialogRoute!);
    _dialogRoute = null;
  }
}

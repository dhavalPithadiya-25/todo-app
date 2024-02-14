import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/firebase_options.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return runApp(
      await builder(),
    );
  }, (error, stack) {
    debugPrint("error :: $error");
    debugPrint("stack :: $stack");
  });
}

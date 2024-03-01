import 'package:flutter/material.dart';
import 'package:todo_app/app/demo.dart';
import 'package:todo_app/app/theme/theme.dart';
import 'package:todo_app/ui/auth/auth.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const LoginView(),
    );
  }
}

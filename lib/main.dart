import 'package:flutter/material.dart';
import 'package:avaliacaop2igorgabriel/routes.dart';
import 'package:avaliacaop2igorgabriel/styles/app_theme.dart';

void main() {
  runApp(const IMCApp());
}

class IMCApp extends StatelessWidget {
  const IMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Login',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: appRoutes,
    );
  }
}

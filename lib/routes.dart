
import 'package:flutter/material.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/imc_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginView(),
  '/register': (context) => const RegisterView(),
  '/imc': (context) => const IMCView(),
};

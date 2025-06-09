
import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../utils/validators.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _authController = AuthController();
  String _mensagemErro = '';

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final sucesso = await _authController.login(
          _emailController.text, _senhaController.text);
      if (sucesso) {
        Navigator.pushReplacementNamed(context, '/imc');
      } else {
        setState(() => _mensagemErro = 'Email ou senha incorretos.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: validateEmail,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: validatePassword,
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _login, child: const Text('Entrar')),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text('Cadastrar-se'),
              ),
              if (_mensagemErro.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_mensagemErro, style: const TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


String? validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'Informe o e-mail';
  if (!RegExp(r'^.+@.+\..+\$').hasMatch(value)) return 'Email inválido';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.length < 6) return 'Senha deve ter ao menos 6 caracteres';
  return null;
}

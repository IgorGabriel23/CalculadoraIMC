
class User {
  final String email;
  final String senha;

  User({required this.email, required this.senha});

  Map<String, dynamic> toMap() {
    return {'email': email, 'senha': senha};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(email: map['email'], senha: map['senha']);
  }
}

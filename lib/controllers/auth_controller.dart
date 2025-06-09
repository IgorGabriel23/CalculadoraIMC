
import '../database/db_helper.dart';
import '../models/user_model.dart';

class AuthController {
  final DBHelper _dbHelper = DBHelper();

  Future<bool> login(String email, String senha) async {
    final user = await _dbHelper.getUser(email);
    if (user != null && user.senha == senha) {
      return true;
    }
    return false;
  }

  Future<bool> register(User user) async {
    final exists = await _dbHelper.getUser(user.email);
    if (exists != null) return false;
    await _dbHelper.insertUser(user);
    return true;
  }
}

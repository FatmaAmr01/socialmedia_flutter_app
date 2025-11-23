import 'package:flutter/material.dart';
import 'package:socialmedia/models/user_model.dart';
import 'package:socialmedia/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? user;

  Future<void> login({required String email, required String password}) async {
    user = await AuthService.login(email: email, password: password);
    notifyListeners();
  }

  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    user = await AuthService.signUp(
      userName: userName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    notifyListeners();
  }
}

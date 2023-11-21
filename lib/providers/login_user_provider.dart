import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/model/login_model.dart';

class UserPasswordModel {
  String password = "";
  String confirmPassword = "";
}

final userPasswordProvider = StateProvider<UserPasswordModel>((ref) {
  return UserPasswordModel();
});

final loginUserProvider = StateProvider<LoginResponse?>((ref) {
  return;
});

final loginPasswordProvider = StateProvider<String>((ref) {
  final userPassword = ref.read(userPasswordProvider);
  return userPassword.password;
});

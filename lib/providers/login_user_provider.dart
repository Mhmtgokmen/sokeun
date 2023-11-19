import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/model/login_model.dart';

final loginUserProvider = StateProvider<LoginResponse?>((ref) {
  return ;
});

final loginPasswordProvider = StateProvider<String>((ref) {
  return "";
});


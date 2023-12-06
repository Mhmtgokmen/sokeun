import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthUtility {
  static Future<String?> getToken() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen('token')) {
      await Hive.openBox<String>('token');
    }
    final box = await Hive.openBox<String>('token');
    final token = box.get('token');
    await box.close();

    return token;
  }

  static Future<Map<String, dynamic>?> getAllDate() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen('token')) {
      await Hive.openBox<String>('token');
    }
    final box = await Hive.openBox<String>('token');
    final token = box.get('token');
    final register = box.get('registerState');
    final confirmed = box.get('isConfirmed');
    await box.close();

    return {
      'token': token,
      'register': register,
      'isConfirmed': confirmed,
    };
  }

  static void saveToken(
      String token, String registerState, String isConfirmed) async {
    await Hive.initFlutter();

    try {
      if (!Hive.isBoxOpen('token')) {
        await Hive.openBox<String>('token');
      }
      final box = await Hive.openBox<String>('token');
      await box.put('token', token);
      await box.put('registerState', registerState);
      await box.put('isConfirmed', isConfirmed);
      await box.close();
      print("Hive token:$token");
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  static Future<bool> deleteToken() async {
    await Hive.initFlutter();
    if (Hive.isBoxOpen('token')) {
      await Hive.openBox<String>('token');
    }
    final box = await Hive.openBox<String>('token');
    await box.delete('token');
    await box.close();

    return true;
  }
}

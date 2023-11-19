import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://development.coneexa.com/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, dynamic data, {String? token}) async {
    return await _dio.post(
      url,
      data: data,
      options: Options(
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ),
    );
  }
}

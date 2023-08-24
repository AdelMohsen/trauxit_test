import 'package:dio/dio.dart';
import 'package:trauxit_test/utilities/constance/strings.dart';
import 'package:trauxit_test/utilities/network/end_point.dart';

//Todo : internet permission
// <uses-permission android:name="android.permission.INTERNET"/>

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        followRedirects: true,
        maxRedirects: 1000,
        connectTimeout: const Duration(minutes: 10),
        receiveTimeout: const Duration(minutes: 10),
        sendTimeout: const Duration(minutes: 10),
        validateStatus: (status) {
          return status! <= 501;
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queries,
    String? newToken,
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers = {
      'Accept-Language': lang,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*",
    };

    return await _dio.get(url, queryParameters: queries, data: data);
  }
}

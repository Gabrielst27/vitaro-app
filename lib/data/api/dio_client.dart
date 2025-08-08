import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitaro_app/main.dart';

class DioClient {
  final Dio _dio = Dio();
  final SupabaseClient _user = supabase;

  DioClient() {
    _dio.options.validateStatus = (status) => status != null;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _user.auth.currentUser == null
              ? ''
              : _user.auth.currentSession!.accessToken;
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Dio get client => _dio;
}

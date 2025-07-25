import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DioClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Dio _dio = Dio();

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final currentUser = _firebaseAuth.currentUser;
          final token = currentUser == null
              ? ''
              : await currentUser.getIdToken();
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

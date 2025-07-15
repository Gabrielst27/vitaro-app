import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiService {
  final String vitaroApiUrl = dotenv.env['VITARO_API']!;
}

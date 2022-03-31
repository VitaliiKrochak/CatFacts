import 'package:dio/dio.dart';

extension IsSuccessStatusCode on Response {
  bool get isSuccessStatusCode => statusCode! >= 200 && statusCode! <= 299;
}

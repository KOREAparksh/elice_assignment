import 'package:elice_pa/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDio {
  final Dio dio;

  CustomDio() : dio = Dio() {
    dio.options = BaseOptions(
      connectTimeout: RETROFIT_CONNECT_TIMEOUT,
      receiveTimeout: RETROFIT_RECEIVE_TIMEOUT,
      baseUrl: dotenv.get("BASE_URL"),
    );
    dio.interceptors.clear();
    dio.interceptors.add(LogInterceptor(
      responseHeader: false,
      requestHeader: false,
      responseBody: true,
    ));
    dio.interceptors.add(_CustomInterceptor());
  }
}

class _CustomInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    //401 에러
  }
}

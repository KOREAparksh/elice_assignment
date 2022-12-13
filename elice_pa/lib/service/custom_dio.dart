import 'package:elice_pa/config/config.dart';
import 'package:dio/dio.dart';

class CustomDio {
  final Dio dio;

  CustomDio() : dio = Dio() {
    dio.interceptors.add(LogInterceptor(
      responseHeader: false,
      requestHeader: false,
    ));
    dio.interceptors.add(_CustomInterceptor());
  }
}

class _CustomInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = RETROFIT_CONNECT_TIMEOUT;
    options.receiveTimeout = RETROFIT_RECEIVE_TIMEOUT;
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    //401 에러
  }
}

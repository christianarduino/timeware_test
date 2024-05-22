import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll(
      {'token': const String.fromEnvironment('API_TOKEN')},
    );
    super.onRequest(options, handler);
  }
}

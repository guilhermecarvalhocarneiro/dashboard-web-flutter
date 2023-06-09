import 'dart:math';

import 'package:dio/dio.dart';

import '../../global/constants.dart';
import '../../global/global_context.dart';
import '../../storage/storage.dart';

class AuthInterceptor extends Interceptor {
  final int index = Random().nextInt(1000);
  final Storage storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = storage.getData(SessionStorageKeys.accessToken.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      GlobalContext.instance.loginExpire();
    } else {
      handler.next(err);
    }
  }
}

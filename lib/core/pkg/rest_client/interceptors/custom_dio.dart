import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../../../storage/storage.dart';
import 'auth_interceptor.dart';


class CustomDio extends DioForBrowser {
  late AuthInterceptor _authInterceptor;

  CustomDio(Storage storage)
      : super(
          BaseOptions(
            baseUrl: '',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
          
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptor(storage);
  }

  CustomDio auth() {
    // print('interceptors: $interceptors');
    if(!interceptors.contains(_authInterceptor)){
      interceptors.add(_authInterceptor);
    }
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}

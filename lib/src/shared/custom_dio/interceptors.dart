import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) async {
    print("REQUEST[${options.method}] => PATH:${options.path}");
    return options;
  }

  @override
  Future onResponse(Response response) async {
    //200
    //201
    print("RESPONSE[${response.statusCode}] => PATH:${response.request.path}");
    return response;
  }

  @override
  Future onError(DioError e) async {
    //Exception
    print("RESPONSE[${e.response.statusCode}] => PATH:${e.request.path}");
    return e;
  }
}

import 'package:dio/dio.dart';

import '../constants.dart';
import 'interceptors.dart';

class CustomDio{

  var dio = Dio();

  CustomDio(){
    dio.options.baseUrl = BASE_URL;
    dio.interceptors.add(CustomInterceptors());
    dio.options.connectTimeout = 5000;
  }
}
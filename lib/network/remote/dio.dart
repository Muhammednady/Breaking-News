import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioHelper {
  static Dio? dio;

  static void init() {

    dio = new Dio();
    
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/", receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String Url,  Map<String, dynamic>? query}) async {
    return await dio!.get(Url, queryParameters: query);
  }
}

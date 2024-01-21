// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class CoreApi {
  static CoreApi? _instance;

  static CoreApi get instance {
    _instance ??= CoreApi();
    return _instance!;
  }
  CancelToken cancelToken = CancelToken();

  final Dio _dio = Dio();

  CoreApi() {
    String baseUrl = dotenv.env['BASE_API_URL']!;
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer '};
  }

  Future setToken(String token) async {
    _dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
  }

  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    final response = await _dio.get(path, queryParameters: params, cancelToken: cancelToken);
    return response;
  }

  Future<Response> post(String path, {data, Map<String, dynamic>? params}) async {
    final response = await _dio.post(path, data: data, cancelToken: cancelToken);
    return response;
  }

  Future<Response> put(String path,
      {data, Map<String, dynamic>? params}) async {
    final response = await _dio.put(path, data: data, queryParameters: params, cancelToken: cancelToken);
    return response;
  }

  Future<Response> delete(String path, {Map<String, dynamic>? params}) async {
    final response = await _dio.delete(path, queryParameters: params);
    return response;
  }
}

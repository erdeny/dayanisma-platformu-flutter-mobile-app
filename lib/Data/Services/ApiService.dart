import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();

  static final APIService instance = APIService._singleton();
  final String baseUrl = "....";

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    String? email,
    String? password,
    Map<String, dynamic>? param,
    String? contentType = 'application/json',
    formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          responseType: ResponseType.json,
          headers: email != null && password != null
              ? {
                  HttpHeaders.authorizationHeader:
                      'Basic ${base64.encode(utf8.encode('$email:$password'))}',
                }
              : null,
        ),
      );
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}

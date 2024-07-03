import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movies_example/config.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[HttpHeaders.authorizationHeader] =
        'Bearer ${Config.accessToken}';

    super.onRequest(options, handler);
  }
}

class MoviesApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Config.backendUrl,
      receiveDataWhenStatusError: true,
      contentType: 'application/json',
      validateStatus: (status) => status != null && status < 300,
      connectTimeout: const Duration(seconds: 8),
      queryParameters: {
        'language': 'hr-HR',
      },
    ),
  );

  MoviesApi() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<Response> getMoviesList({
    required int page,
  }) async {
    final params = {'page': page};

    final response = await _dio.get(
      '/movie/popular',
      queryParameters: params,
    );

    return response;
  }

  Future<Response> getMovie({required int id}) async {
    final response = await _dio.get('/movie/$id');

    return response;
  }
}

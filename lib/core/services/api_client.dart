import 'package:dio/dio.dart';

/// REST API client. Dio + interceptors + centralized error handling.
/// Use for hybrid apps (Firebase + REST).
class ApiClient {
  ApiClient({
    String? baseUrl,
    Map<String, dynamic>? headers,
    Dio? dio,
  })  : _dio = dio ?? Dio(),
        _baseUrl = baseUrl ?? '' {
    _dio.options.baseUrl = _baseUrl;
    if (headers != null) _dio.options.headers.addAll(headers);
    _dio.interceptors.addAll([
      _AuthInterceptor(),
      _LogInterceptor(),
      _ErrorInterceptor(),
    ]);
  }

  final Dio _dio;
  final String _baseUrl;

  Dio get dio => _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.get<T>(path, queryParameters: queryParameters, options: options);

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
}

/// Adds auth token to requests. Override or replace with your token source.
class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Example: options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }
}

/// Logs requests and responses in debug.
class _LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    assert(() {
      // ignore: avoid_print
      print('API → ${options.method} ${options.uri}');
      return true;
    }());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    assert(() {
      // ignore: avoid_print
      print('API ← ${response.statusCode} ${response.requestOptions.uri}');
      return true;
    }());
    handler.next(response);
  }
}

/// Maps Dio errors to [ApiException].
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: ApiException.fromDio(err),
        type: err.type,
      ),
    );
  }
}

/// Typed API errors for consistent handling in repositories.
class ApiException implements Exception {
  ApiException({
    required this.message,
    this.statusCode,
    this.code,
  });

  factory ApiException.fromDio(DioException err) {
    final res = err.response;
    final statusCode = res?.statusCode;
    final data = res?.data;
    String message = err.message ?? 'Network error';
    String? code;

    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? data['error'] as String? ?? message;
      code = data['code'] as String?;
    }

    if (statusCode != null) {
      if (statusCode == 401) message = 'Unauthorized';
      if (statusCode == 403) message = 'Forbidden';
      if (statusCode == 404) message = 'Not found';
      if (statusCode >= 500) message = 'Server error';
    }

    return ApiException(
      message: message,
      statusCode: statusCode,
      code: code,
    );
  }

  final String message;
  final int? statusCode;
  final String? code;

  @override
  String toString() => 'ApiException: $message (${statusCode ?? "n/a"})';
}

import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_components/flutter_app_components.dart';

@injectable
class FCAPIClient {
  static FCAPIClient? _instance;
  final Dio _dio = Dio();
  late final String _baseUrl;
  void Function()? onErrorNavigation;
  void Function()? onError;
  void Function()? onRequest;
  void Function()? onResponse;

  factory FCAPIClient({
    String? baseUrl,
    void Function()? onErrorNavigation,
    void Function()? onError,
    void Function()? onRequest,
    void Function()? onResponse,
  }) {
    if (_instance == null) {
      if (baseUrl == null) {
        throw ArgumentError(
          'APIClient must be initialized with baseUrl at least once before use.',
        );
      }
      _instance = FCAPIClient._internal(
        baseUrl,
        onErrorNavigation,
        onError,
        onRequest,
        onResponse,
      );
    }
    return _instance!;
  }

  FCAPIClient._internal(
    String baseUrl,
    this.onErrorNavigation,
    this.onError,
    this.onRequest,
    this.onResponse,
  ) {
    _baseUrl = baseUrl;
    _initialize();
  }

  void _initialize() {
    if (kDebugMode && !kIsWeb) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (
        HttpClient client,
      ) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          onRequest ?? () {};
          options.headers['Access-Control-Allow-Origin'] = '*';
          options.headers['Accept'] = "application/json";
          options.baseUrl = _baseUrl;
          options.followRedirects = true;
          logger.d(
            "==> API : ${options.baseUrl}${options.path}\n==> Header: ${options.headers}\n==> Body: ${options.data}\n==> Method: ${options.method}",
          );
          return handler.next(options);
        },
        onResponse: (
          Response response,
          ResponseInterceptorHandler handler,
        ) async {
          onResponse ?? () {};
          if (response.data != null && response.data is! String) {
            if (response.data['message'] != null) {
              FCUtils.appToast(message: response.data['message'].toString());
            }
          }
          return handler.next(response);
        },
        onError: (
          DioException dioError,
          ErrorInterceptorHandler handler,
        ) async {
          onError ?? () {};
          logger.f(
            "==> API URL : ${dioError.requestOptions.uri}\n==> data: ${dioError.requestOptions.data}\n==> Response: ${dioError.response?.data}\n==> Response error: ${dioError.error}",
          );
          if (dioError.response != null) {
            if (dioError.response!.statusCode == HttpStatus.unauthorized) {
              onErrorNavigation ?? () {};
            }
            final errorResponse =
                dioError.response?.data as Map<String, dynamic>;
            if (errorResponse['message'] != null) {
              if (errorResponse['message'].toString().isNotEmpty) {
                FCUtils.appToast(
                  message: errorResponse['message'].toString(),
                  toastType: ToastType.error,
                );
              }
            }
          }
          return handler.next(dioError);
        },
      ),
    );
  }

  //GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? query,
    String? subPath,
    String? newURL,
    bool showErrorToast = true,
  }) {
    String reqPath = path;
    if (subPath != null) reqPath = path + subPath;
    reqPath = reqPath;
    return _dio.get(
      reqPath,
      queryParameters: query,
      options: Options(
        extra: {'showErrorToast': showErrorToast, 'new_url': newURL},
      ),
    );
  }

  //POST
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    String? subPath,
    bool showErrorToast = true,
  }) {
    String reqPath = path;
    if (subPath != null) reqPath = path + subPath;
    reqPath = reqPath;
    return _dio.post(
      reqPath,
      data: data,
      queryParameters: query,
      options: Options(extra: {'showErrorToast': showErrorToast}),
    );
  }

  //POST TO HTML
  Future<Response> postHtml(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    String? subPath,
    bool showErrorToast = true,
  }) {
    String reqPath = path;
    if (subPath != null) reqPath = path + subPath;
    reqPath = '$reqPath.html';
    return _dio.post(
      reqPath,
      data: data,
      queryParameters: query,
      options: Options(extra: {'showErrorToast': showErrorToast}),
    );
  }

  //PUT
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    String? subPath,
    String? newURL,
    bool showErrorToast = true,
  }) {
    String reqPath = path;
    if (subPath != null) reqPath = path + subPath;
    reqPath = reqPath;
    return _dio.put(
      reqPath,
      data: data,
      queryParameters: query,
      options: Options(
        extra: {'showErrorToast': showErrorToast, 'new_url': newURL},
      ),
    );
  }

  //DELETE
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    String? subPath,
    String? newURL,
    bool showErrorToast = true,
  }) {
    String reqPath = path;
    if (subPath != null) reqPath = path + subPath;
    reqPath = reqPath;
    return _dio.delete(
      reqPath,
      data: data,
      queryParameters: query,
      options: Options(
        extra: {'showErrorToast': showErrorToast, 'new_url': newURL},
      ),
    );
  }
}

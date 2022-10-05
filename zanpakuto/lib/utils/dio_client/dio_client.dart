import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zanpakuto/utils/dio_client/app_interceptor.dart';

class DioClient {
  static DioClient? _singleton;
  static late Dio _dio;

  DioClient._() {
    _dio = createDioClient();
  }
  factory DioClient() {
    return _singleton ??= DioClient._();
  }

  Dio get instance => _dio;
  Dio createDioClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8000',
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      AppInterceptor(),
    ]);

    return dio;
  }
}

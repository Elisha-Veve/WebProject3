import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanpakuto/blocs/auth/auth_bloc.dart';
import 'package:zanpakuto/models/models.dart';

class AppInterceptor extends Interceptor {
  static AppInterceptor? _singleton;

  AppInterceptor._internal();

  factory AppInterceptor() {
    return _singleton ??= AppInterceptor._internal();
  }
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      final state = AuthBloc().state;
      if (state.token != null) {
        options.headers[HttpHeaders.authorizationHeader] =
            'Bearer ${state.token}';
      }
    }
    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final responseData = mapResponseData(
      requestOptions: response.requestOptions,
      response: response,
    );
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final errorMessage = getErrorMessage(err.type, err.response?.statusCode);

    final responseData = mapResponseData(
        requestOptions: err.requestOptions,
        response: err.response,
        customMessage: errorMessage,
        isErrorResponse: true);
    return handler.resolve(responseData);
  }
}

String getErrorMessage(DioErrorType errorType, int? statusCode) {
  String errorMessage = "";
  switch (errorType) {
    case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      errorMessage = DioErorrMessage.deadlineExceededException;
      break;
    case DioErrorType.response:
      switch (statusCode) {
        case 400:
          errorMessage = DioErorrMessage.badRequestException;
          break;
        case 401:
          errorMessage = DioErorrMessage.unauthorizedException;
          break;
        case 403:
          errorMessage = DioErorrMessage.forbiddenException;
          break;
        case 404:
          errorMessage = DioErorrMessage.notFoundException;
          break;
        case 405:
          errorMessage = DioErorrMessage.methodNotAllowedException;
          break;
        case 409:
          errorMessage = DioErorrMessage.conflictException;
          break;
        case 500:
          errorMessage = DioErorrMessage.internalServerException;
          break;
      }
      break;
    case DioErrorType.cancel:
      break;
    case DioErrorType.other:
      errorMessage = DioErorrMessage.otherException;
      break;
  }
  return errorMessage;
}

class DioErorrMessage {
  static const String deadlineExceededException =
      "The connection timed out, please try again later";
  static const String badRequestException = "Invalid request";
  static const String unauthorizedException = "Access denied";
  static const String forbiddenException = "Access denied";
  static const String notFoundException = "Resource not found";
  static const String methodNotAllowedException = "Method not allowed";
  static const String conflictException =
      "Conflict occured, resource already exists";
  static const String internalServerException =
      "Unknown Error Internal Server Exception";
  static const String otherException = "Unknown Error";
}

Response<dynamic> mapResponseData({
  Response<dynamic>? response,
  String customMessage = "",
  bool isErrorResponse = false,
  required RequestOptions requestOptions,
}) {
  final bool hasResponseData = response?.data != null;

  Map<String, dynamic>? responseData = response?.data;

  if (hasResponseData) {
    responseData!.addAll({
      "statusCode": response?.statusCode,
      "statusMessage": response?.statusMessage
    });
  }

  return Response(
    requestOptions: requestOptions,
    data: hasResponseData
        ? responseData
        : AppResponse(
            message: customMessage,
            success: isErrorResponse ? false : true,
            statusCode: response?.statusCode,
            statusMessage: response?.statusMessage,
          ).toJson(((value) => null)),
  );
}

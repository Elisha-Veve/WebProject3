import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
// @freezed
part 'app_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AppResponse<T> extends Equatable {
  final bool success;
  final String message;
  final T? data;
  final int statusCode;

  final String statusMessage;

  const AppResponse._({
    required this.success,
    required this.message,
    this.data,
    required this.statusCode,
    required this.statusMessage,
  });

  factory AppResponse({
    bool? success,
    required String message,
    T? data,
    int? statusCode,
    String? statusMessage,
  }) {
    return AppResponse._(
      success: success ?? false,
      message: message,
      data: data,
      statusCode: statusCode ?? 200,
      statusMessage: statusMessage ?? 'OK',
    );
  }

  @override
  List<Object> get props => [
        success,
        message,
        data ?? '',
      ];

  factory AppResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$AppResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return _$AppResponseToJson(this, toJsonT);
  }

  @override
  bool get stringify => true;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'error_response.dart';

part 'api_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    this.data,
    this.error,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  final bool success;

  @JsonKey(name: 'result')
  final T? data;

  final ErrorResponse? error;
}

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class ApiListResponse<T> {
  const ApiListResponse({
    required this.success,
    this.data,
    this.error,
  });

  factory ApiListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) =>
      _$ApiListResponseFromJson(json, fromJsonT);

  final bool success;

  @JsonKey(name: 'result')
  final List<T>? data;

  final ErrorResponse? error;
}

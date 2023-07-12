import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';

part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @Default(-1) int code,
    @Default('') String message,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  factory ErrorResponse.empty() => const ErrorResponse();

  const ErrorResponse._();

  bool get isEmpty => code == -1 && message.isEmpty;

  bool get isNotEmpty => !isEmpty;
}

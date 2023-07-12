import 'package:dio/dio.dart';

class DioClientException implements Exception {
  DioClientException.fromException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        msgError = 'Yêu cầu đến máy chủ đã bị hủy.';
        break;
      case DioExceptionType.connectionTimeout:
        msgError = 'Kết nối quá hạn.';
        break;
      case DioExceptionType.connectionError:
        msgError = 'Kết nối bị lỗi.';
        break;
      case DioExceptionType.receiveTimeout:
        msgError = 'Thời gian máy chủ phản hồi quá hạn';
        break;
      case DioExceptionType.sendTimeout:
        msgError = 'Yêu cầu đến máy chủ quá hạn';
        break;
      case DioExceptionType.badResponse:
        msgError = _handleBadResponse(dioException.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioException.error?.toString().contains('SocketException') == true) {
          msgError = 'Không có kết nối mạng';
          break;
        }
        msgError = 'Đã xảy ra lỗi không mong muốn.';
        break;
      default:
        msgError = 'Đã xảy ra sự cố.';
        break;
    }
  }

  String msgError = '';

  String _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Yêu cầu xấu.';
      case 401:
        return 'Xác thực thất bại.';
      case 403:
        return 'Người dùng không được phép truy cập.';
      case 404:
        return 'Tài nguyên được yêu cầu không tồn tại.';
      case 422:
        return 'Xác thực dữ liệu không thành công.';
      case 429:
        return 'Quá nhiều yêu cầu.';
      case 500:
        return 'Lỗi máy chủ nội bộ.';
      default:
        return 'Rất tiếc, đã xảy ra sự cố!';
    }
  }

  @override
  String toString() => msgError;
}

import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    return const ApiErrorModel(
      message: 'Something went wrong. Please try again.',
    );
  }

  static ApiErrorModel _handleBadResponse(DioException error) {
    final data = error.response?.data;

    if (data is Map<String, dynamic>) {
      final parsedError = _tryParseApiError(data);

      if (parsedError != null) {
        return parsedError;
      }
    }

    return _mapStatusCode(error.response?.statusCode);
  }

  static ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiErrorModel(message: 'Connection timeout.');

      case DioExceptionType.sendTimeout:
        return const ApiErrorModel(message: 'Send timeout.');

      case DioExceptionType.receiveTimeout:
        return const ApiErrorModel(message: 'Receive timeout.');

      case DioExceptionType.transformTimeout:
        return const ApiErrorModel(message: 'Response processing timeout.');

      case DioExceptionType.badCertificate:
        return const ApiErrorModel(
          message: 'Unable to verify server certificate.',
        );

      case DioExceptionType.cancel:
        return const ApiErrorModel(message: 'Request was cancelled.');

      case DioExceptionType.connectionError:
        return const ApiErrorModel(message: 'Unable to connect to the server.');

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.unknown:
        return const ApiErrorModel(message: 'Unexpected error occurred.');
    }
  }

  static ApiErrorModel _mapStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const ApiErrorModel(message: 'Bad request.');

      case 401:
        return const ApiErrorModel(
          message: 'Your session is unauthorized or has expired.',
        );

      case 403:
        return const ApiErrorModel(
          message: 'You do not have permission to perform this action.',
        );

      case 404:
        return const ApiErrorModel(message: 'Resource not found.');

      case 405:
        return const ApiErrorModel(message: 'Method not allowed.');

      case 409:
        return const ApiErrorModel(
          message: 'The request conflicts with the current data.',
        );

      case 422:
        return const ApiErrorModel(message: 'Validation error.');

      case 429:
        return const ApiErrorModel(
          message: 'Too many requests. Please try again later.',
        );

      case 500:
        return const ApiErrorModel(message: 'Internal server error.');

      case 502:
        return const ApiErrorModel(message: 'Bad gateway.');

      case 503:
        return const ApiErrorModel(
          message: 'Service is temporarily unavailable.',
        );

      default:
        return const ApiErrorModel(message: 'Something went wrong.');
    }
  }

  static ApiErrorModel? _tryParseApiError(Map<String, dynamic> data) {
    try {
      final error = ApiErrorModel.fromJson(data);

      final hasMessage =
          error.message != null && error.message!.trim().isNotEmpty;

      final hasErrors = error.errors != null && error.errors!.isNotEmpty;

      if (hasMessage || hasErrors) {
        return error;
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}

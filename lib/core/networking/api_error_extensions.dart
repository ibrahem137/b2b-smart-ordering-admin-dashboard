import 'api_error_model.dart';

extension ApiErrorModelX on ApiErrorModel {
  String get displayMessage {
    final validationMessage = _firstValidationMessage();

    if (validationMessage != null) {
      return validationMessage;
    }

    final messageValue = message?.trim();

    if (messageValue != null && messageValue.isNotEmpty) {
      return messageValue;
    }

    return 'Something went wrong. Please try again.';
  }

  String? _firstValidationMessage() {
    final validationErrors = errors;

    if (validationErrors == null || validationErrors.isEmpty) {
      return null;
    }

    for (final value in validationErrors.values) {
      if (value is List && value.isNotEmpty) {
        return value.first.toString();
      }

      if (value is String && value.trim().isNotEmpty) {
        return value;
      }
    }

    return null;
  }
}

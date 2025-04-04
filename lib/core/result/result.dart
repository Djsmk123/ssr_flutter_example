import 'package:flutter_application_1/core/error/app_error.dart' show AppError;

class Result<T> {
  final T? data;
  final AppError? appError;

  Result({required this.data, required this.appError});
  bool get isSuccess => appError != null;
}

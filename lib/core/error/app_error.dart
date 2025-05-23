abstract class AppError {
  final String error;

  AppError({required this.error});
}

class GenericError extends AppError {
  GenericError({required super.error});
}

class JSONError extends AppError {
  JSONError({required super.error});
}

class APIError extends AppError {
  final String errorCode;
  APIError({required super.error, required this.errorCode});
}

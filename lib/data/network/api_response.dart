class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;
  final String? error;

  ApiResponse({this.data, this.message, this.error, this.success = false});

  factory ApiResponse.success(T data, {String? message}) {
    return ApiResponse(data: data, message: message, success: true);
  }

  factory ApiResponse.error(String errorMessage) {
    return ApiResponse(error: errorMessage, success: false);
  }
}

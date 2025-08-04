class NetworkException implements Exception {
  String? message;
  int statusCode;

  NetworkException({
    required this.message,
    required this.statusCode,
  });
}

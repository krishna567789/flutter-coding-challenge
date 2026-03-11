class ApiException implements Exception {

  final String message;

  ApiException(this.message);

  @override
  String toString() {
    return message;
  }
}

class FetchDataException extends ApiException {
  FetchDataException(super.message);
}

class BadRequestException extends ApiException {
  BadRequestException(super.message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message);
}
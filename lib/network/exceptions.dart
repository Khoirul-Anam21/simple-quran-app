class PrimaryException implements Exception {
  final String? _excMessage;
  final String? _excPrefix;

  PrimaryException([this._excMessage, this._excPrefix]);

  String toString() {
    return '$_excPrefix $_excMessage';
  }
}

class FetchDataException extends PrimaryException {
  FetchDataException([String? message])
      : super(message, 'Communication error:');
}

class BadRequestException extends PrimaryException {
  BadRequestException([String? message]) : super(message, 'Invalid request:');
}

class UnauthorizedException extends PrimaryException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized:');
}

class InvalidInputException extends PrimaryException {
  InvalidInputException([String? message]) : super(message, 'Invalid input:');
}

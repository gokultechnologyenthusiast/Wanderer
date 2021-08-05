class CustomException implements Exception {
  /// this class is to handle exceptions
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    /// this method helps us to return a string with respect to error
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InternalServerException extends CustomException {
  InternalServerException([message]) : super(message, "Internal Server: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

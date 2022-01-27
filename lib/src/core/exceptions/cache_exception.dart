import 'package:flutter_boilerplate/src/core/exceptions/request_exception.dart';

class CacheException extends RequestException {
  CacheException({ required message}) : super(
      message: message
  );
}
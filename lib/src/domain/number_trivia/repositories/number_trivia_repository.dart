import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/src/core/exceptions/request_exception.dart';
import 'package:flutter_boilerplate/src/core/requests/number_trivia/get_concrete_number_trivia_request.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<RequestException, NumberTrivia>> getRandomNumberTrivia();
  Future<Either<RequestException, NumberTrivia>> getConcreteNumberTrivia(GetConcreteNumberTriviaRequest params);
}

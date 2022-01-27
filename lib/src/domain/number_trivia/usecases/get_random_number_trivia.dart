
import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/src/core/exceptions/request_exception.dart';
import 'package:flutter_boilerplate/src/core/requests/number_trivia/get_random_number_trivia_request.dart';
import 'package:flutter_boilerplate/src/core/usecase/number_trivia/get_number_trivia.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/entities/number_trivia.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/repositories/number_trivia_repository.dart';

class GetRandomNumberTriviaUseCase implements UseCaseGetNumberTrivia<Either<RequestException, NumberTrivia>, GetRandomNumberTriviaRequest> {
  final NumberTriviaRepository _numberTriviaRepository;

  GetRandomNumberTriviaUseCase(this._numberTriviaRepository);

  @override
  Future<Either<RequestException, NumberTrivia>> call({required GetRandomNumberTriviaRequest params}) {
    return _numberTriviaRepository.getRandomNumberTrivia();
  }
}

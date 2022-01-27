import 'package:binder/binder.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/src/core/exceptions/request_exception.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/models/number_trivia_model.dart';

final StateRef<Either<RequestException, NumberTriviaModel?>> randomNumberTriviaStateRef = StateRef(const Right(null));
final loadingRandomNumberTriviaStateRef = StateRef(false);
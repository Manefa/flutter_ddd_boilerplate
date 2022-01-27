import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/src/config/env_config.dart';
import 'package:flutter_boilerplate/src/core/exceptions/cache_exception.dart';
import 'package:flutter_boilerplate/src/core/exceptions/failures.dart';
import 'package:flutter_boilerplate/src/core/exceptions/request_exception.dart';
import 'package:flutter_boilerplate/src/core/platforms/network_info/network_info.dart';
import 'package:flutter_boilerplate/src/core/requests/number_trivia/get_concrete_number_trivia_request.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/datasources/local/number_trivia_local_db_service.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/datasources/remote/number_trivia_api_service.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/models/number_trivia_model.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository with EnvConfig{
  final NumberTriviaApiService remoteNumberTrivia;
  final NumberTriviaLocalDbService localNumberTrivia;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({required this.remoteNumberTrivia, required this.localNumberTrivia, required this.networkInfo});

  @override
  Future<Either<RequestException, NumberTriviaModel>> getConcreteNumberTrivia(GetConcreteNumberTriviaRequest params) async {
    if(await networkInfo.isConnected){
      try {
        final data = await remoteNumberTrivia.getNumberTrivia(params.number!);
        localNumberTrivia.cacheNumberTrivia(data);
        return Right(data);
      } on RequestException catch (e) {
        return Left(e);
      }
    }else{
      try{
        final localTrivia = await localNumberTrivia.getLocalNumberTrivia();
        return Right(localTrivia);
      }on CacheException{
        return Left(CacheFailure(message: EnvConfig.failureToLoadDataLocally));
      }
    }
  }


  @override
  Future<Either<RequestException, NumberTriviaModel>> getRandomNumberTrivia() async {
    if(await networkInfo.isConnected){
      try {
        final data = await remoteNumberTrivia.getRandomNumberTrivia();
        localNumberTrivia.cacheNumberTrivia(data);
        return Right(data);
      } on RequestException catch (e) {
        return Left(e);
      }
    }else{
      try{
        print("je suis passer par la ");
        final localTrivia = await localNumberTrivia.getLocalNumberTrivia();
        return Right(localTrivia);
      }on CacheException{
        return Left(CacheFailure(message: EnvConfig.failureToLoadDataLocally));
      }
    }
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/src/core/exceptions/request_exception.dart';
import 'package:flutter_boilerplate/src/core/platforms/dio_http_client/dio_http_client.dart';
import 'package:flutter_boilerplate/src/core/platforms/dio_http_client/http_data_source.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/models/number_trivia_model.dart';

class NumberTriviaApiService extends HttpDataSource<DioHttpClient> {
  NumberTriviaApiService({required DioHttpClient client}) : super(client);

  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    try{
      final response = await client.get(path:"http://numbersapi.com/random/trivia");
        final responseJson = json.decode(json.encode(response));
        return NumberTriviaModel.fromJson(responseJson);
    }on DioError catch (e){
      throw RequestException(message: e.message);
    }
  }

  Future<NumberTriviaModel> getNumberTrivia(int number) async {
    try{
      final response = await client.get(path: "http://numbersapi.com/$number");
        final responseJson = json.decode(json.encode(response));
        return NumberTriviaModel.fromJson(responseJson);
    }on DioError catch (e){
      throw RequestException(message: e.message);
    }
  }
}

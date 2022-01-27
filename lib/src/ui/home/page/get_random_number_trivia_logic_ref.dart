import 'package:binder/binder.dart';
import 'package:flutter_boilerplate/src/core/requests/number_trivia/get_concrete_number_trivia_request.dart';
import 'package:flutter_boilerplate/src/core/requests/number_trivia/get_random_number_trivia_request.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/usecases/get_random_number_trivia.dart';
import 'package:flutter_boilerplate/src/injector.dart';
import 'package:flutter_boilerplate/src/ui/home/state/get_random_number_trivia_state.dart';

final getRandomNumberTriviaLogic = LogicRef((scope) => GetRandomNumberTriviaLogic(scope));

class GetRandomNumberTriviaLogic with Logic implements Loadable{
  const GetRandomNumberTriviaLogic(this.scope);

  @override
  final Scope scope;

  GetRandomNumberTriviaUseCase get getRandomNumberTriviaUseCase => injector<GetRandomNumberTriviaUseCase>();
  GetConcreteNumberTriviaUseCase get getConcreteNumberTriviaUseCase => injector<GetConcreteNumberTriviaUseCase>();

  @override
  Future<void> load() async {
    write(loadingRandomNumberTriviaStateRef, true);
    final data = await getRandomNumberTriviaUseCase(params: GetRandomNumberTriviaRequest());
    write(randomNumberTriviaStateRef, data);
    write(loadingRandomNumberTriviaStateRef, false);
  }

  Future<void> getConcreteNumberTrivia(int number) async {
    write(loadingRandomNumberTriviaStateRef, true);
    final data =  await getConcreteNumberTriviaUseCase(params: GetConcreteNumberTriviaRequest(number: number));
    write(randomNumberTriviaStateRef, data);
    write(loadingRandomNumberTriviaStateRef, false);
  }
}
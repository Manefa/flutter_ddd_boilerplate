import 'package:flutter_boilerplate/src/core/platforms/dio_http_client/dio_http_client.dart';
import 'package:flutter_boilerplate/src/core/platforms/local_storage/local_storage.dart';
import 'package:flutter_boilerplate/src/core/platforms/network_info/network_info.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/datasources/local/number_trivia_local_db_service.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/datasources/remote/number_trivia_api_service.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/repositories/number_trivia_repository.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_boilerplate/src/domain/number_trivia/usecases/get_random_number_trivia.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';


final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// Register service locators
  ///
  /// Misc
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);
  injector.registerLazySingleton<LocalStorage>(() => LocalStorage(pref: injector()));
  injector.registerLazySingleton<DioHttpClient>(() => DioHttpClient());
  injector.registerLazySingleton(() => InternetConnectionChecker());
  injector.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));


  /// Register services
    /// Number Trivia
  injector.registerLazySingleton<NumberTriviaApiService>(() => NumberTriviaApiService(client: injector(),));

  injector.registerLazySingleton<NumberTriviaLocalDbService>(() =>NumberTriviaLocalDbService(injector()));

  /// Register repositories
  injector.registerLazySingleton<NumberTriviaRepository>( () => NumberTriviaRepositoryImpl(
    remoteNumberTrivia: injector(),
    localNumberTrivia: injector(),
    networkInfo: injector(),
  ));

  /// Register use cases
  injector.registerLazySingleton<GetRandomNumberTriviaUseCase>( () => GetRandomNumberTriviaUseCase(injector()));
  injector.registerLazySingleton<GetConcreteNumberTriviaUseCase>( () => GetConcreteNumberTriviaUseCase(injector()));

}

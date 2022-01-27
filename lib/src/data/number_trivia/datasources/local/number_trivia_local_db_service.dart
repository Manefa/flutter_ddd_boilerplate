import 'dart:convert';

import 'package:flutter_boilerplate/src/config/env_config.dart';
import 'package:flutter_boilerplate/src/core/constants/storage_keys.dart';
import 'package:flutter_boilerplate/src/core/exceptions/cache_exception.dart';
import 'package:flutter_boilerplate/src/core/platforms/local_storage/local_storage.dart';
import 'package:flutter_boilerplate/src/data/number_trivia/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumberTriviaLocalDbService extends LocalStorage with StorageKeys, EnvConfig{
  NumberTriviaLocalDbService(SharedPreferences? pref) : super(
    pref: pref
  );

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) async {
    final save = json.encode(triviaToCache.toJson());
    write(StorageKeys.cachedNumberTrivia, save);
  }

  Future<NumberTriviaModel> getLocalNumberTrivia() {
    final numberTriviaJsonString = read(StorageKeys.cachedNumberTrivia);
    if (numberTriviaJsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(numberTriviaJsonString)));
    } else {
      throw CacheException(message: EnvConfig.failureToLoadDataLocally);
    }
  }
}

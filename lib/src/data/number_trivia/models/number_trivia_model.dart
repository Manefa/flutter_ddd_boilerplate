import 'package:flutter_boilerplate/src/domain/number_trivia/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia{
  const NumberTriviaModel({
    required String? text,
    required int? number,
  }) : super(
    text: text,
    number: number
  );

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) => NumberTriviaModel(
    text: json["text"] ?? null,
    number: json["number"] ?? null,
  );

  @override
  Map<String, dynamic> toJson() => {
    "text": text ?? null,
    "number": number ?? null,
  };
}
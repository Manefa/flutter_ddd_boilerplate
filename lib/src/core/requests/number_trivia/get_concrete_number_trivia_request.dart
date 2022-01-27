
import 'package:flutter_boilerplate/src/core/requests/i_request.dart';

import '/src/core/resources/types.dart';

class GetConcreteNumberTriviaRequest implements IRequest {
  final int? number;
  GetConcreteNumberTriviaRequest({required this.number});

  @override
  Json toJson() {
    return {
      "number": number,
    };
  }
}

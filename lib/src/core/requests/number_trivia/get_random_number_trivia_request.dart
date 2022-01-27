import 'package:flutter_boilerplate/src/core/requests/i_request.dart';

import '/src/core/resources/types.dart';

class GetRandomNumberTriviaRequest implements IRequest {
  GetRandomNumberTriviaRequest();

  @override
  Json toJson() {
    return {
    };
  }
}

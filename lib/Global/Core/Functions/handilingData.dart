

import '../Class/StatusRequest.dart';

handilingData(response) {
  //to hande the resopne
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}

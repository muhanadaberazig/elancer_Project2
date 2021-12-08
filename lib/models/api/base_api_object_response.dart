import 'dart:convert';

import 'package:elancer_api/models/api/base_api_response.dart';
import 'package:elancer_api/models/user.dart';

class BaseApiObjectReponse<T> extends BaseApiResponse {
  /* بيجي ع شكلين الي تحت object , data*/
  //late T object;
  late T data;

  BaseApiObjectReponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json.containsKey('data')) {
      if (T == User) {
        data = User.fromJson(json['data']) as T;
      }
    }

    if (json.containsKey('object')) {}
  }
}

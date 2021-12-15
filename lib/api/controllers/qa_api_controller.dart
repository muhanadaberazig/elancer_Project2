
import 'dart:convert';
import 'dart:io';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/api/api_fqa.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../api_settings.dart';
class QAApiController with Helpers{

  Future<bool> sendQ(BuildContext context,
      {required String Subject,required String Message}) async {
    var url = Uri.parse(ApiSettings.contactRequests);
    var response = await http.post(url, body: {
      'subject':Subject,
      'message':Message
    }, headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token,
    }
    );
    if (response.statusCode == 201) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }
  Future<List<FAQs>> getFAQs() async {
    var url = Uri.parse(ApiSettings.faqs);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
         , HttpHeaders.acceptHeader: 'application/json',
    }
    );
    if (response.statusCode == 200) {

      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => FAQs.fromJson(jsonObject))
          .toList();

    }
    return [];
  }

}
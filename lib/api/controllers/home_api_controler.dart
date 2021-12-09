import 'dart:convert';
import 'dart:io';

import 'package:elancer_api/api/api_settings.dart';
import 'package:elancer_api/api/controllers/api_helper.dart';
import 'package:elancer_api/models/api/home_response.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;
class HomeApiController with ApiHelper{

  Future<HomeResponse?> showHome()async {
    var url =Uri.parse(ApiSettings.home);
    var response =await http.get(url,headers: {
      HttpHeaders.authorizationHeader:SharedPrefController().token
    });
    print("ahmed"+response.statusCode.toString());
    if(response.statusCode==200){
      print("ahmed"+jsonDecode(response.body).toString());
    return HomeResponse.fromJson(jsonDecode(response.body)['data']);
    }
    return null;

  }
}
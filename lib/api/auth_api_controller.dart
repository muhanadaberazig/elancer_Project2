import 'dart:convert';
import 'dart:io';
import 'package:elancer_api/api/api_settings.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/api/base_api_object_response.dart';
import 'package:elancer_api/models/api/base_api_response.dart';
import 'package:elancer_api/models/register.dart';
import 'package:elancer_api/models/user.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'controllers/api_helper.dart';


class AuthApi with ApiHelper {
  Future<bool> register(BuildContext context,
      {required RegisterUser clinet}) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      'name': clinet.name,
      'mobile': clinet.mobile,
      'password': clinet.password,
      'gender': clinet.gender,
      'STORE_API_KEY': ApiSettings.storeApiKey,
      'city_id': clinet.city_id
    });
    print("ahmed "+response.statusCode.toString());
    if (response.statusCode == 201) {
      {
        // showSnackBar(
        //   context: context,
        //   message: jsonDecode(response.body)['message'],
        // );
        print(jsonDecode(response.body)['code']);

        return true;
      }
    } else if (response.statusCode == 400) {
      // showSnackBar(
      //   context: context,
      //   message: jsonDecode(response.body)['message'],
      //   error: true,
      // );
    }
    return false;
  }

Future<bool> login(BuildContext context,
    {required String mobile, required String password}) async {
  var url = Uri.parse(ApiSettings.login);
  var response = await http.post(url, body: {
    'mobile': mobile,
    'password': password,
  },
  headers: headers,
  // {
  //   'lang':'en'
  // }
  );
  if (response.statusCode == 200) {
    //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
    var baseApiResponse =BaseApiObjectReponse<User>.fromJson(jsonDecode(response.body));
    showSnackbar(context, message: baseApiResponse.message,error:false);
    await SharedPrefController().save(user: baseApiResponse.data);
    return true;
  } else if (response.statusCode == 400) {
    var message =jsonDecode(response.body)['message'];
    showSnackbar(context, message: message,error:  true);
  }else{
    showSnackbar(context, message: 'Something went wrong , please try again',error: true);
  }
return false;
}
Future<bool> logout() async {
  var url = Uri.parse(ApiSettings.logout);
  var response = await http.get(url, headers: {
    HttpHeaders.authorizationHeader: SharedPrefController().token,
    HttpHeaders.acceptHeader: 'application/json'
  });
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 401) {
    SharedPrefController().clear();
    return true;
  }
  return false;
}

Future<bool> activePhone(BuildContext context,
    {required String mobile, required String code}) async {
  var url = Uri.parse(ApiSettings.activatePhone);
  var response = await http.post(url, body: {
    'mobile': mobile,
    'code': code,
  },
      headers:{
        'lang':'en'
      }
  );

  if (response.statusCode == 200) {

    //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
   var jsonObject = jsonDecode(response.body)['data'];
    User student = User.fromJson(jsonObject);
   SharedPrefController().save(user: student);
    // showSnackBar(
    //   context: context,
    //   message: jsonDecode(response.body)['message'],
    // );
    return true;
  } else if (response.statusCode == 400) {
    // showSnackBar(
    //   context: context,
    //   message: jsonDecode(response.body)['message'],
    //   error: true,
    // );
  }
  return false;
}

// Future<bool> logout() async {
//   var url = Uri.parse(ApiSettings.logout);
//   var response = await http.get(url, headers: {
//     HttpHeaders.authorizationHeader: SharedPrefController().token,
//     HttpHeaders.acceptHeader: 'application/json'
//   });
//   print(response.statusCode);
//   if (response.statusCode == 200 || response.statusCode == 401) {
//     SharedPrefController().clear();
//     return true;
//   }
//   return false;
// }

//   Future<bool> forgetPassword(BuildContext context,
//       {required String mobile}) async {
//     var url = Uri.parse(ApiSettings.forgetPassword);
//     var response = await http.post(url, body: {
//       'mobile': mobile,
//     },
//         headers:{
//           'lang':'en'
//         }
//     );
//
//     if (response.statusCode == 200) {
//       print(jsonDecode(response.body)['code']);
//       return true;
//     } else if (response.statusCode == 400) {
//       showSnackBar(
//         context: context,
//         message: jsonDecode(response.body)['message'],
//         error: true,
//       );
//     } else {
//       showSnackBar(
//         context: context,
//         message: 'Something went wrong, please try again!',
//         error: true,
//       );
//     }
//     return false;
//   }
//
//   Future<bool> resetPassword(
//     BuildContext context, {
//     required String mobile,
//     required String code,
//     required String password,
//   }) async {
//     var url = Uri.parse(ApiSettings.resetPassword);
//     var response = await http.post(
//       url,
//       body: {
//         'mobile': mobile,
//         'code': code,
//         'password': password,
//         'password_confirmation': password,
//       },
//       headers: {HttpHeaders.acceptHeader: 'application/json', 'lang':'en'},
//     );
//
//     if (response.statusCode == 200) {
//       showSnackBar(
//         context: context,
//         message: jsonDecode(response.body)['message'],
//       );
//       return true;
//     } else if (response.statusCode == 400) {
//       showSnackBar(
//         context: context,
//         message: jsonDecode(response.body)['message'],
//         error: true,
//       );
//     } else if (response.statusCode == 500) {
//       showSnackBar(
//         context: context,
//         message: 'Something went wrong, try again',
//         error: true,
//       );
//     }
//     return false;
//   }
// }
}
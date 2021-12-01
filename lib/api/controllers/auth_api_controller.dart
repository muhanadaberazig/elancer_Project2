import 'dart:convert';
import 'dart:io';

import 'package:elancer_api/api/api_settings.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/student.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helpers/helpers.dart';
import '../../prefs/shared_pref_controller.dart';

class AuthApiController with Helpers {
  Future<bool> register(BuildContext context,
      {required Student student}) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      'full_name': student.fullName,
      'mobile': student.email,
      'password': student.passsword,
      'gender': student.gender,
    });
    if (response.statusCode == 201) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
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

  Future<bool> login(BuildContext context,
      {required String mobile, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    });
    if (response.statusCode == 200) {
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      var jsonObject = jsonDecode(response.body)['object'];
      Student student = Student.fromJson(jsonObject);
      SharedPrefController().save(student: student);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
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

  Future<bool> forgetPassword(BuildContext context, {required String email}) async {
    var url = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(url, body: {
      'email': email,
    });

    if(response.statusCode == 200){
      print(jsonDecode(response.body)['code']);
      return true;
    }else if(response.statusCode == 400){
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }else {
      showSnackBar(
        context: context,
        message: 'Something went wrong, please try again!',
        error: true,
      );
    }
    return false;
  }
}

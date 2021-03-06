import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin  ApiHelper{
  void showSnackbar( BuildContext context ,{required String message ,bool error =false}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),
    backgroundColor: error ? Colors.red:Colors.green,
    duration: Duration(seconds: 1),
    dismissDirection: DismissDirection.horizontal,
    ),
    );

  }
  Map<String,String> get headers{
    var headers={
      'Accept':'application/jon',
      // 'lang':SharedPrefController().checkLanguage,
    };
    if(SharedPrefController().loggedIn)
      headers[ 'Authorization']='Bearer TOKEN';
      return headers;
  }
}
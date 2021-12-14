
import 'dart:convert';
import 'dart:io';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/faverite/faverite_model.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

class ApiFavoriteProductController with Helpers{


  Future<List<Faverite>> getFaverite() async {
    var url = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader: SharedPrefController().token,
          HttpHeaders.acceptHeader:'application/json'
        }
    );

    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Faverite.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<bool> addFaverite(BuildContext context,
      {required String id}) async {
    var url = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.post(url, body: {
      'product_id': id,

    }
        ,headers:{
          HttpHeaders.authorizationHeader: SharedPrefController().token,
          HttpHeaders.acceptHeader:'application/json'
        }
    );
    if (response.statusCode == 200) {
      {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );
        return true;
      }
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }


}
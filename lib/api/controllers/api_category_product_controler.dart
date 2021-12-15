
import 'dart:convert';
import 'dart:io';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/api/category_api.dart';
import 'package:elancer_api/models/api/product.dart';
import 'package:elancer_api/models/category_sup_product_model/ProductDetails/base_prodict_detales.dart';
import 'package:elancer_api/models/category_sup_product_model/ProductDetails/opject_prodict.dart';
import 'package:elancer_api/models/category_sup_product_model/supcategory.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

class ApiCategoryProductController with Helpers{
  Future<List<Categorie>> getCategories() async {
    var url = Uri.parse(ApiSettings.categories);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Categorie.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<List<SupCategory>> getSupCategories(String idcat) async {
    var url = Uri.parse(ApiSettings.categoriesSup+idcat);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => SupCategory.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<List<Product>> getProduct(String idcat) async {
    var url = Uri.parse(ApiSettings.product+idcat);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;

      return categoriesJsonArray
          .map((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<ObjectPr?> getProductDitales(String idcat) async {
    var url = Uri.parse(ApiSettings.productDetales+idcat);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      BaseProdict apiResponse = BaseProdict.fromJson(jsonResponse);
      return apiResponse.object;
    }
    return null;
  }

}
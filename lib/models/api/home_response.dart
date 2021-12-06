import 'package:elancer_api/models/api/category_api.dart';
import 'package:elancer_api/models/api/product.dart';
import 'package:elancer_api/models/api/slider.dart';
import 'package:elancer_api/models/category.dart';

import 'base_api_response.dart';

class HomeResponse  extends BaseApiResponse{
 late List<Slider> slider;
 late List<Categorie> categories;
 late List<Product> latestProducts;
 late List<Product> famousProducts;


  HomeResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider.add( Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories =  <Categorie>[];
      json['categories'].forEach((v) {
        categories.add( Categorie.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts =  <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts.add( Product.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <Product>[];
      json['famous_products'].forEach((v) {
        famousProducts.add( Product.fromJson(v));
      });
    }
  }


}
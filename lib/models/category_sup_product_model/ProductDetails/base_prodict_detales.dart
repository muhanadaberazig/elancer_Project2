import 'package:elancer_api/models/category_sup_product_model/ProductDetails/opject_prodict.dart';


class BaseProdict {
 late  bool status;
 late String message;
 late ObjectPr object;


  BaseProdict.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    object =
    (json['object'] != null ? ObjectPr.fromJson(json['object']) : null)!;
  }

}


import 'package:elancer_api/models/category_sup_product_model/ProductDetails/sup.dart';

import 'imag.dart';

class ObjectPr {
 late int id;
 late String nameEn;
 late String nameAr;
 late String infoEn;
 late String infoAr;
 late int price;
 late int quantity;
 late var overalRate;
 late int subCategoryId;
 late var productRate;
 late Null offerPrice;
 late bool isFavorite;
 late String imageUrl;
 late List<Images> images;
 late SubCategory subCategory;

 ObjectPr();
  ObjectPr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    subCategory = (json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null)!;
  }

}

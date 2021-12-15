import 'package:elancer_api/api/controllers/api_category_product_controler.dart';
import 'package:elancer_api/models/api/category_api.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryGetxControler extends GetxController{
  RxList<Categorie> category = <Categorie>[].obs;
  RxBool loadingsupCategory = true.obs;
  final ApiCategoryProductController _apiController=ApiCategoryProductController();
  static CategoryGetxControler get to => Get.find<CategoryGetxControler>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
    // getData();
  }

  Future<void> getCategory() async {
    loadingsupCategory = true.obs;
    category.value= await _apiController.getCategories();
    loadingsupCategory.value = false;
    print("getSupCategory1"+category.value.length.toString());
    // notifyListeners();
    // update();
  }
}
import 'package:elancer_api/api/controllers/api_category_product_controler.dart';
import 'package:elancer_api/models/api/product.dart';
import 'package:elancer_api/models/category_sup_product_model/ProductDetails/opject_prodict.dart';
import 'package:elancer_api/models/category_sup_product_model/supcategory.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SupCatPrpGetxController extends GetxController{
  RxList<SupCategory> supCategory = <SupCategory>[].obs;
  RxBool loadingsupCategory = true.obs;
  final ApiCategoryProductController _apiController=ApiCategoryProductController();
  static SupCatPrpGetxController get to => Get.find<SupCatPrpGetxController>();
  Future<void> getSupCategory1(String id) async {
    loadingsupCategory = true.obs;
    supCategory.value.clear();
    supCategory.value= await _apiController.getSupCategories(id);
    loadingsupCategory.value = false;
    print("getSupCategory1"+supCategory.value.length.toString());
    // notifyListeners();
    // update();
  }
  RxBool loadingProduct = false.obs;
  RxList<Product> product = <Product>[].obs;
  Future<void> getProduct(String id) async {
    loadingProduct.value = true;
    product.value = await _apiController.getProduct(id);
    loadingProduct.value = false;
    // notifyListeners();
    // update();
  }
  ObjectPr ditiles=ObjectPr();
  RxBool ditilesloding=false.obs;
  RxBool isfavertD=false.obs;
  Future<void> getDitilesProduct(String id) async {
    ditilesloding.value = true;
    ditiles = (await _apiController.getProductDitales(id))!;
    ditilesloding.value = false;
    isfavertD.value=ditiles.isFavorite;
    // notifyListeners();
    update();
  }
}
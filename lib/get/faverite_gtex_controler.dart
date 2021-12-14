import 'package:elancer_api/api/controllers/api_favorite_products_controler.dart';
import 'package:elancer_api/models/faverite/faverite_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FaveriteGetxControler extends GetxController{
  RxList<Faverite> supCategory = <Faverite>[].obs;
  RxBool loadingsupCategory = true.obs;
  final ApiFavoriteProductController _apiController=ApiFavoriteProductController();
  static FaveriteGetxControler get to => Get.find<FaveriteGetxControler>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFaverite();
  }
  Future<void> getFaverite( ) async {
    loadingsupCategory = true.obs;
    supCategory.value= await _apiController.getFaverite();
    loadingsupCategory.value = false;
  }

}
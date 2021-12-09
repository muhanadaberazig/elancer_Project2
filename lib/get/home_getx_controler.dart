import 'package:elancer_api/api/controllers/home_api_controler.dart';
import 'package:elancer_api/models/api/home_response.dart';
import 'package:get/get.dart';

class HomeGetxController extends GetxController{
  HomeResponse? homeResponse;
  bool loading =false;
  final HomeApiController _apiController =HomeApiController();
  static HomeGetxController get to => Get.find<HomeGetxController>();
  @override
  void onInit() {
    getHome();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void>getHome()async{
    loading =true;
    homeResponse =await _apiController.showHome();
    loading =false;
    update();
  }
}
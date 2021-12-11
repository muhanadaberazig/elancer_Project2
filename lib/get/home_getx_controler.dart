import 'package:elancer_api/api/controllers/home_api_controler.dart';
import 'package:elancer_api/models/api/home_response.dart';
import 'package:get/get.dart';

class HomeGetxController extends GetxController{
  HomeResponse? homeResponse;
  bool loading =false;

  List<String> images = [];
  bool loadingimages =true;
  final HomeApiController _apiController =HomeApiController();
  static HomeGetxController get to => Get.find<HomeGetxController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHome();
   // getData();
  }
  Future<void>getHome()async{
    loading =true;
    homeResponse =await _apiController.showHome();
    loadingimages =true;
    images = [
      homeResponse!.slider[0].imageUrl,
      homeResponse!.slider[1].imageUrl,
      homeResponse!.slider[2].imageUrl,
      homeResponse!.slider[3].imageUrl,
    ];
    loadingimages =false;
    loading =false;
    update();
  }
}
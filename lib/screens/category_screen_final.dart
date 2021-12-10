import 'package:elancer_api/api/auth_api_controller.dart';
import 'package:elancer_api/get/home_getx_controler.dart';
import 'package:elancer_api/models/cardsscrollwidget.dart';
import 'package:elancer_api/models/category.dart';
import 'package:elancer_api/models/latest.dart';
import 'package:elancer_api/models/sup_category.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:elancer_api/screens/prodect_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hexcolor/hexcolor.dart';


var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;



class CustomIcons {
  static const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData option = IconData(0xe902, fontFamily: "CustomIcons");
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool logout = false;
  List<String> images = [
    HomeGetxController.to.homeResponse!.slider[1].imageUrl,
    HomeGetxController.to.homeResponse!.slider[2].imageUrl,
    HomeGetxController.to.homeResponse!.slider[3].imageUrl,
    HomeGetxController.to.homeResponse!.slider[4].imageUrl,
  ];
  var currentPage;

  @override
  void initState() {
    currentPage = images.length - 1.0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controllerr = PageController(initialPage: images.length - 1);
    controllerr.addListener(() {
      setState(() {
        currentPage = controllerr.page!;
      });
    });
    return Scaffold(
          backgroundColor: Color(0xFF2d3447),
          body: GetBuilder<HomeGetxController>(builder: (controller) {
            if (controller.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.homeResponse != null) {
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Welcome,",
                              style: TextStyle(
                                  color: HexColor('#36596A'),
                                  fontSize: 40,
                                  letterSpacing: 1.0),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              'Our Rica Mobile App',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Stack(
                        children: <Widget>[
                          CardScrollWidget(
                            currentPage: currentPage,
                            list: images,
                          ),
                          Positioned.fill(
                            child: InkWell(
                              child: PageView.builder(
                                itemCount: images.length,
                               controller: controllerr,
                               //  scrollDirection: Axis.vertical,
                                reverse: true,
                                itemBuilder: (context, index) {
                                  return Container();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: HexColor('#36596A'),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0.h, vertical: 6.0.w),
                                child: const Center(
                                  child: Text(
                                    "Category",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_horiz_outlined,
                                  size: 40, color: HexColor('#36596A')),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/category_screen');
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      !HomeGetxController.to.loading &&
                              HomeGetxController
                                  .to.homeResponse!.categories.isNotEmpty
                          ? Container(
                              height: 190.h,
                              child: GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                ),
                                itemCount: HomeGetxController
                                    .to.homeResponse!.categories.length,
                                itemBuilder: (context, index) {
                                  return category_widget(title: HomeGetxController.to.homeResponse!.categories[index].nameEn,imageUrl: HomeGetxController.to.homeResponse!.categories[index].imageUrl,);
                                  // Favourites(
                                    //     title: HomeGetxController
                                    //         .to
                                    //         .homeResponse!
                                    //         .categories[index]
                                    //         .nameEn,
                                    //     imageUrl: HomeGetxController.to.homeResponse!.categories[index].imageUrl);

                                },
                              ),
                            )
                          : HomeGetxController.to.loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 250.h),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.error,
                                          size: 100,
                                        ),
                                        Text(
                                          'No Data',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: HexColor('#36596A'),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0.h, vertical: 6.0.w),
                                child: const Center(
                                  child: Text(
                                    "Latest",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_horiz_outlined,
                                  size: 40, color: HexColor('#36596A')),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 190.h,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          itemCount: HomeGetxController
                              .to.homeResponse!.latestProducts.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Favourites(
                                  title: HomeGetxController
                                      .to
                                      .homeResponse!
                                      .latestProducts[index]
                                      .nameEn,
                                  price: HomeGetxController.to.homeResponse!.latestProducts[index].price,
                                  quantity: HomeGetxController.to.homeResponse!.latestProducts[index].quantity,
                                  imageUrl: HomeGetxController.to.homeResponse!.latestProducts[index].imageUrl),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: HexColor('#36596A'),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0.h, vertical: 6.0.w),
                                child: const Center(
                                  child: Text(
                                    "Famous",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_horiz_outlined,
                                  size: 40, color: HexColor('#36596A')),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 190.h,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          itemCount: HomeGetxController.to.homeResponse!.famousProducts.length,
                          itemBuilder: (context, index) {
                            return Favourites(
                                title:  HomeGetxController
                                    .to
                                    .homeResponse!
                                    .famousProducts[index]
                                    .nameEn,
                                price: HomeGetxController.to.homeResponse!.latestProducts[index].price,
                                quantity: HomeGetxController.to.homeResponse!.latestProducts[index].quantity,
                                imageUrl: HomeGetxController.to.homeResponse!.famousProducts[index].imageUrl);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250.h),
                  child: Column(
                    children: [
                      Icon(
                        Icons.error,
                        size: 100,
                      ),
                      Text(
                        'No Data',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              );
            }
          })
    );

  }
}
class category_widget extends StatelessWidget {
  String title;
  String imageUrl;




   category_widget({
     required this.title,
     required this.imageUrl,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('#36596A'),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    //height: 244.5.h,
                    width: 155.w,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 5.h,),

                      ],

                    ),

                  ),
                ),
              ],
            ),

          ],


        )
      // Favourites(
      //     title: HomeGetxController
      //         .to
      //         .homeResponse!
      //         .categories[index]
      //         .nameEn,
      //     imageUrl: 'images/iphone1.jpg'),
    );
  }
}

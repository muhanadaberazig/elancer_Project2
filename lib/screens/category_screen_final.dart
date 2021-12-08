
import 'package:elancer_api/get/home_getx_controler.dart';
import 'package:elancer_api/models/cardsscrollwidget.dart';
import 'package:elancer_api/models/category.dart';
import 'package:elancer_api/models/latest.dart';
import 'package:elancer_api/models/sup_category.dart';
import 'package:elancer_api/screens/prodect_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hexcolor/hexcolor.dart';

import 'sup_category.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

List<String> images = [
  "images/huawei2.jpg",
  "images/huawei2.jpg",
  "images/huawei2.jpg",
  "images/iphone1.jpg",
  "images/iphone1.jpg",
  "images/iphone1.jpg",
  "images/huawei2.jpg",
  "images/iphone1.jpg",
  "images/iphone1.jpg",
  "images/iphone1.jpg",
];

List<String> title = [
  "Hounted Ground",
  "Fallen In Love",
  "The Dreaming Moon",
  "Jack the Persian and the Black Castel",
  "Jack the Persian and the Black Castel",
  "Jack the Persian and the Black Castel",
  "Hounted Ground",
  "Fallen In Love",
  "The Dreaming Moon",
  "Jack the Persian and the Black Castel",
];

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
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return SafeArea(
      child: Scaffold(
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
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: InkWell(
                        child: PageView.builder(
                          itemCount: images.length,
                          // controller: controller,
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(

                        child: Favourites(
                            title: 'title',
                            imageUrl: 'images/iphone1.jpg'),
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(

                        child: Favourites(
                            title: 'title',
                            imageUrl: 'images/iphone1.jpg'),
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Favourites(
                          title: 'title', imageUrl: 'images/iphone1.jpg');
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
                Text('No Data',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ],
            ),
          ),
        );
      }
    })),

    );
  }
}

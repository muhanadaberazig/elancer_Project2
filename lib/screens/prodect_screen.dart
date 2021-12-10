import 'package:elancer_api/get/home_getx_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());

  var ifaverite = false;

//  List<SupCat> product = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeGetxController>(builder: (controller){
        if(controller.loading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(controller.homeResponse!=null){
          return  CustomScrollView(
              slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery
                  .of(context)
                  .size
                  .height * 0.6,
              elevation: 0,
              snap: true,
              floating: true,
              stretch: true,
              backgroundColor: HexColor('#36596A'),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                ],
                background: CarouselSlider(
                  items: [
                    Image.asset(
                      'images/12.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/14.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/12.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                  options: CarouselOptions(
                    pageSnapping: true,
                    disableCenter: true,
                    height: 500.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  ),
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(45.h),
                  child: Transform.translate(
                    offset: Offset(0, 1),
                    child: Container(
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2d3447),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                          child: Container(
                            width: 50,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                    ),
                  )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.70,
                      color: const Color(0xFF2d3447),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    'HomeGetxController.to.homeResponse!.latestProducts[index].nameEn',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Samsung',
                                    style: TextStyle(
                                        color: HexColor('#36596A'),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    '\$1100',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5.h),
                                  const Text(
                                    '\$1500',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  RatingBar.builder(
                                    itemSize: 15,
                                    glow: true,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) =>
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          Divider(color: HexColor('#36596A')),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Items Produect :',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              FloatingActionButton(
                                enableFeedback: true,
                                autofocus: true,
                                focusColor: Colors.black,
                                isExtended: true,
                                onPressed: () {
                                  setState(() {
                                    ifaverite = !ifaverite;
                                  });
                                },
                                child: Icon(
                                  Icons.favorite,
                                  size: 40,
                                  color: ifaverite ? Colors.red : Colors.grey,
                                ),
                                backgroundColor: HexColor('#36596A'),
                                tooltip: 'Add to favorites',
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 350,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: Text(
                                'The Galaxy A52 is a part fo the A series and was launched alongside the Galaxy A72. The new Galaxy A52 has a big 6.5-inch full-HD+ Super AMOLED display with a hole-punch display. It also has a fast 90Hz refresh rate. The build is mainly plastic which isn\'t the case with its competition. The Galaxy A52 is IP67 rated and you will find a rubber seal around the SIM tray to help keep water and dust out.  The smartphone has a 4,500mAh battery and is manageable for single-handed use. The battery is capable of fast charging at 25W but you only get a 15W charger in the boxThe Galaxy A52 has a quad-camera setup at the back consisting of a 64-megapixel primary camera, a 12-megapixel ultra-wide angle camera, a 5-megapixel macro camera and a 5-megapixel depth sensor. The camera performance is acceptable in daylight but the wide-angle camera does not capture as much detail as the primary camera. Close-up were good and the Galaxy A52 clicks some good portraits. The macro camera too was good in delivering a crisp output. Selfies taken from the selfie camera were good and the camera did a good job in most lighting conditions The Galaxy A52 is powered by a Qualcomm Snapdragon 720 processor which is a decent processor. It is capable of delivering good performance and coupled with 6GB of RAM, multitasking too is easy. Compared to some of the direct competitors of the Galaxy A52, the chipset feels underpoweredThe 4,500mAh battery delivers good battery life and the phone went for about a day and a half with our usage. Charging times weren\'t too long either with the charger topping the phone up in about an hour and a half.',
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 20,
                              ),
                            ),
                          ),
                        ],
                      ))
                ])),
          ]);
        }else{
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
      }),
    );
  }
}
// Text('Ram', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
// SizedBox(height: 10,),
// Container(
// height: 60,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: Ram.length,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap: () {
// setState(() {
// _selectedRam = index;
// });
// },
// child: AnimatedContainer(
// duration: Duration(milliseconds: 500),
// margin: EdgeInsets.only(right: 10),
// decoration: BoxDecoration(
// color: _selectedRam == index ? Colors.yellow[800] : Colors.grey.shade200,
// shape: BoxShape.circle
// ),
// width: 40,
// height: 40,
// child: Center(
// child: Text(Ram[index], style: TextStyle(color: _selectedRam == index ? Colors.white : Colors.black, fontSize: 15),),
// ),
// ),
// );
// },
// ),
// ),
// SizedBox(height: 5,),

import 'package:elancer_api/api/controllers/api_favorite_products_controler.dart';
import 'package:elancer_api/get/faverite_gtex_controler.dart';
import 'package:elancer_api/get/home_getx_controler.dart';
import 'package:elancer_api/get/sup_category_proubuct_getx_controler.dart';
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
  ProductScreen({Key? key,required this.id}) : super(key: key);
  int id;
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 // HomeGetxController _homeGetxController = Get.put(HomeGetxController());

  var ifaverite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SupCatPrpGetxController.to.getDitilesProduct(widget.id.toString());
  }

//  List<SupCat> product = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx((){
        return
        SupCatPrpGetxController.to.ditilesloding.value?
        Center(
          child: CircularProgressIndicator(),
        )
            :!SupCatPrpGetxController.to.ditilesloding.value&&SupCatPrpGetxController.to.ditiles!=null?
        CustomScrollView(
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
                      Image.network(
                        SupCatPrpGetxController.to.ditiles.images[0].imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        SupCatPrpGetxController.to.ditiles.images[1].imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        SupCatPrpGetxController.to.ditiles.images[2].imageUrl,
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
                                      SupCatPrpGetxController.to.ditiles.nameEn,
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
                                      SupCatPrpGetxController.to.ditiles.subCategory.nameEn,
                                      style: TextStyle(
                                          color: HexColor('#36596A'),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      SupCatPrpGetxController.to.ditiles.price.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5.h),
                                    RatingBar.builder(
                                      itemSize: 15,
                                      glow: true,
                                      initialRating: SupCatPrpGetxController.to.ditiles.overalRate.toDouble(),
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
                                    ApiFavoriteProductController().addFaverite(context, id: SupCatPrpGetxController.to.ditiles.id.toString());
                                    setState(() {
                                      ifaverite = !ifaverite;
                                    });
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    size: 40,
                                    color: ifaverite||SupCatPrpGetxController.to.ditiles.isFavorite ? Colors.red : Colors.grey,
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
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(30)),
                              child:  Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Text(
                                  SupCatPrpGetxController.to.ditiles.infoEn,
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
            ]):
        Center(
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
      })

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

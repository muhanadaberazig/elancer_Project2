
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
class ProductScreen extends StatefulWidget {

  ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State< ProductScreen> {
//  List<SupCat> product = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.6,
              elevation: 0,
              snap: true,
              floating: true,
              stretch: true,
              backgroundColor: HexColor('#36596A'),
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                  ],
                  background:
                  CarouselSlider(
                    items: [
                     Container(
                         width: 950,
                         child: Image.asset('images/12.png', fit: BoxFit.cover,)),
                     Image.asset('images/12.png',fit: BoxFit.cover, ),
                     Image.asset('images/12.png',fit: BoxFit.cover, ),
                    ],
                     options: CarouselOptions(
                    height: 500.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  ),
                  )
                  //Image.asset('images/iphone1.jpg', fit: BoxFit.cover,)
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(45.h),
                  child: Transform.translate(
                    offset: Offset(0, 1),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color:  Color(0xFF2d3447),
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
                          )
                      ),
                    ),
                  )
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                      height: MediaQuery.of(context).size.height * 0.70,
                      color:  Color(0xFF2d3447),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                  Text('A52',
                                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Text('SAmsunge', style: TextStyle(color: HexColor('#36596A'), fontSize: 14,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('\$1100',
                                    style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                  Text('\$1500',
                                    style: TextStyle(color: Colors.grey, fontSize: 16,decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(color: HexColor('#36596A')),
                          SizedBox(height: 10.h,),

                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            height: 50,
                            elevation: 0,
                            splashColor: Colors.yellow[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            color: HexColor('#36596A'),
                            child: Center(
                              child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 18),),
                            ),
                          )
                        ],
                      )
                  )
                ])
            ),
          ]
      ),
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


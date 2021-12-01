import 'package:elancer_api/models/prodect.dart';
import 'package:elancer_api/models/sup_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class ProductScreen extends StatefulWidget {
  final SupCat productt;
   ProductScreen({Key? key,required this.productt}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State< ProductScreen> {
//  List<SupCat> product = [];
  List<String> Ram = [
    "4",
    "6",
    "8",
  ];

  List<Color> colors = [
    Colors.black,
    Colors.tealAccent,
    Colors.blue,
  ];
  List<String> Rom=[
    "64",
    "128",
    "256"
  ];
  int _selectedRom=0;
  int _selectedColor = 0;
  int _selectedRam = 1;

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
              backgroundColor: Colors.grey.shade50,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                  ],
                  background: Image.asset(widget.productt.image, fit: BoxFit.cover,)
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(45.h),
                  child: Transform.translate(
                    offset: Offset(0, 1),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      color: Colors.white,
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
                                   Text(widget.productt.title,
                                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Text(widget.productt.brand, style: TextStyle(color: HexColor('#36596A'), fontSize: 14,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Text(widget.productt.price,
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          Divider(color: HexColor('#36596A')),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Container(
                                height: 40.h,
                                  child: Image.asset('images/p2.png')),
                              SizedBox(width: 5.w,),
                              Text("Processor :  ",
                                style: TextStyle(height: 1.50.h, color: HexColor('#36596A'), fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                              Text(widget.productt.cpu,
                                style: TextStyle(height: 1.5.h, color: Colors.grey.shade800, fontSize: 15,),
                              ),
                            ],
                          ),
                          Divider(color: HexColor('#36596A')),
                          Row(
                            children: [
                              Container(
                                  height: 40.h,
                                  child: Image.asset('images/batery.png')),
                              SizedBox(width: 5.w,),
                              Text("Battery :  ",
                                style: TextStyle(height: 1.50.h, color: HexColor('#36596A'), fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                              Text(widget.productt.battery,
                                style: TextStyle(height: 1.5.h, color: Colors.grey.shade800, fontSize: 15,),
                              ),
                            ],
                          ),
                          Divider(color: HexColor('#36596A')),
                          Row(
                            children: [
                              Container(
                                  height: 40.h,
                                  child: Image.asset('images/screen.png')),
                              Text("Screen :  ",
                                style: TextStyle(height: 1.50.h, color: HexColor('#36596A'), fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                              Text(widget.productt.screen,
                                style: TextStyle(height: 1.5.h, color: Colors.grey.shade800, fontSize: 15,),
                              ),
                            ],
                          ),
                          Divider(color: HexColor('#36596A')),
                          Row(
                            children: [
                              Container(
                                  height: 40.h,
                                  child: Image.asset('images/camera.png')),
                              Text("Camera :  ",
                                style: TextStyle(height: 1.50.h, color: HexColor('#36596A'), fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                              Text(widget.productt.camera,
                                style: TextStyle(height: 1.5.h, color: Colors.grey.shade800, fontSize: 15,),
                              ),
                            ],
                          ),
                          Divider(color: HexColor('#36596A')),
                          SizedBox(height: 10.h,),
                          Text("Color", style: TextStyle(color: HexColor('#36596A'), fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10.h,),
                          Container(
                            height: 60.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: colors.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedColor = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    margin: EdgeInsets.only(right: 10.h),
                                    decoration: BoxDecoration(
                                        color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                                        shape: BoxShape.circle
                                    ),
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: _selectedColor == index ? Icon(Icons.check, color: HexColor('#F3F4F5'),) : Container(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('Ram', style: TextStyle(color: HexColor('#36596A'), fontSize: 18,fontWeight: FontWeight.bold),),
                                  Container(
                                    height: 60,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Ram.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedRam = index;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                                color: _selectedRam == index ?  HexColor('#36596A') : Colors.grey.shade200,
                                                shape: BoxShape.circle
                                            ),
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: Text(Ram[index], style: TextStyle(color: _selectedRam == index ? Colors.white : Colors.black, fontSize: 15),),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50.w,),
                              Divider(color: Colors.teal,height: 20,),
                              Column(
                                children: [
                                  Text('Memory', style: TextStyle(color: HexColor('#36596A'), fontSize: 18,fontWeight: FontWeight.bold),),
                                  Container(
                                    height: 60,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Rom.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedRom = index;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                                color: _selectedRom == index ? HexColor('#36596A') : Colors.grey.shade200,
                                                shape: BoxShape.circle
                                            ),
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: Text(Rom[index], style: TextStyle(color: _selectedRom == index ? Colors.white : Colors.black, fontSize: 15),),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
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

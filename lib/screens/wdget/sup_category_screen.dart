import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:elancer_api/models/latest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class SupCategory extends StatefulWidget {
  const SupCategory({Key? key}) : super(key: key);

  @override
  _SupCategoryState createState() => _SupCategoryState();
}

class _SupCategoryState extends State<SupCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        title: Text('Samsung'),
        centerTitle: true,
        backgroundColor: Color(0xFF2d3447),
        elevation: 0,
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            children: [
              FadeInUp(
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: double.infinity,
                  height: 300.h,
                  padding: const EdgeInsets.all(90.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:HexColor('#36596A'), width: 10.0),
                  ),
                  child: Stack(
                    children: [
                      for (double i = 0; i < 360; i += 60)
                        AnimChain(
                            initialDelay: Duration(milliseconds: i.toInt())
                        )
                            .next(
                          wait: Duration(milliseconds: 1000),
                          widget: AnimatedAlignPositioned(
                            dx: 0,
                            dy: 150,
                            duration: Duration(seconds: 1),
                            rotateDegrees: 0,
                            touch: Touch.middle,
                            child: user(0, i),
                          ),
                        )
                            .next(
                          wait: Duration(seconds: 2),
                          widget: AnimatedAlignPositioned(
                            dx: i / 360,
                            dy: 150,
                            duration: Duration(seconds: 1),
                            rotateDegrees: i,
                            touch: Touch.middle,
                            child: user(0, i),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 15.h,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context,   '/product_screen');
                  },
                  child: Favourites(title: 'title',imageUrl: 'images/a525.jpg',price: 15,quantity: 5,),
                );
              },
    ),
            ],
          ),
        ),
      ),
    );
  }
}
user(int index, double number) {
  index = number ~/ 60;

  return FadeInRight(
    delay: Duration(seconds: 1),
    duration: Duration(milliseconds: (index * 100) + 500),
    child: GestureDetector(
      onTap: () {
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: number / 60 * 5.2,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.green.shade100,
                backgroundImage: AssetImage('images/a522.jpg'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

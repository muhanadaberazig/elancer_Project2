
import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:elancer_api/models/latest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);


  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<dynamic> _slimage = [
    {
      'name': 'John',
      'avatar': 'images/logo.png',
    },
    {
      'name': 'Samantha',
      'avatar': 'images/iphone1.jpg',
    },
    {
      'name': 'Mary',
      'avatar': 'images/huawei2.jpg',
    },
    {
      'name': 'Julian',
      'avatar': 'images/huawei2.jpg',
    },
    {
      'name': 'Sara',
      'avatar': 'images/iphone1.jpg',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'images/logo.png',
    }
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        title: const Text('Category'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF2d3447),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: double.infinity,
                  height: 300,
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
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                      Navigator.pushNamed(context,  '/sup_category_screen');
                          },
                    child: category_widget(),
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
                backgroundImage: AssetImage('images/xiomi2.png'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
class category_widget extends StatelessWidget {
  const category_widget({
    Key? key,
  }) : super(key: key);

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
                            'images/a525.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        const Text('Samsung',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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

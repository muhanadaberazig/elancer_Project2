import 'package:elancer_api/models/latest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: GridView.builder(
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
          child: Favourites(
              title: 'title', imageUrl: 'images/iphone1.jpg'),
        );
      },
    ),
    );
  }
}

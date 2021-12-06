import 'package:elancer_api/models/latest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        title: const Text('Category'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF2d3447),
      ),
      body:GridView.builder(
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
              Navigator.pushNamed(context,  '/sup_category_screen');
                  },
            child: Favourites(
                title: 'title', imageUrl: 'images/iphone1.jpg'),
          );
        },
      ),
    );
  }
}

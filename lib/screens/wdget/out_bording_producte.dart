import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class OutBordingProdect extends StatelessWidget {
  final String image;
  final bool selected;
  final double margin;

  OutBordingProdect(
      {required this.image, required this.margin, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitHeight,
                  height: 450.h,
                  width: 345.w,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
              width: selected ? 20.w : 7.w,
              height: selected ? 5.h : 7.h,
              decoration: BoxDecoration(
                  color: selected ? Colors.black : Colors.red,
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.all(margin),
            ),
          )
        ],
      ),
    );
  }
}

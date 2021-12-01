import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBordingContentet extends StatelessWidget {
  final String text;
  final String hinttext;
  final String image;

  OutBordingContentet({
    required this.image,
    this.text = 'a',
    this.hinttext='a'
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h,right: 15.w,left: 15.w),
          child: Image.asset(
            image,
             height: 450.h,
             width: 345.w,
          ),
        ),
        SizedBox(
          height: 39.h,
        ),
        Padding(
          padding:  EdgeInsets.only(left: 15.w),
          child: Container(
            height:108.h ,
            width: 350.w,
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
            ),
          ),
        ),
        Padding(
          padding:EdgeInsets.only(left: 15.w),
          child: Container(
            height: 44.h,
            width: 350.w,
            child: Text(
               hinttext,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
          ),
        )
      ],
    );
  }
}

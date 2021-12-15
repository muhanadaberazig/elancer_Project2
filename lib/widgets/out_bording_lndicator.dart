import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OutBoardingIndicator extends StatelessWidget {
  final bool selected;
  final double margin;



  OutBoardingIndicator({  required this.margin,required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: selected? 20.w:7.w,
      height:  5.h,
        duration: Duration(seconds: 1),
      decoration: BoxDecoration(
          color: selected? Colors.black:Colors.grey ,
          borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.all(margin),

      );
  }
}
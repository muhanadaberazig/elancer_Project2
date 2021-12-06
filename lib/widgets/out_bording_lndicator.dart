import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OutBoardingIndicator extends StatelessWidget {
  final bool selected;
  final double margin;



  OutBoardingIndicator({  required this.margin,required this.selected});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: selected? 20.w:7.w,
      height: selected ? 5.h:7.h,
      decoration: BoxDecoration(
        color: selected? Colors.black:Colors.grey ,
        borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.all(margin),
    );
  }
}
import 'package:flutter/material.dart';
class outBoardingIndicator extends StatelessWidget {
  final double margin;
  final bool selected;



  outBoardingIndicator({ this.margin=0, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 10,
      decoration: BoxDecoration(
        color: selected? Colors.blue:Colors.grey ,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsetsDirectional.only(end: margin),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class NewWidget extends StatelessWidget {
  NewWidget({
    Key? key,
    required this.image,
    required this.id,
    required this.title,
    this.count=0
  }) : super(key: key);
  String image;
  int count;
  String title;
  int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 260.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child: Image.asset(image,fit:BoxFit.fitHeight)),
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Container(
                width: 202.w,
                height: 60.h,
                decoration:  BoxDecoration(
                    color: HexColor('#36596A'),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                ),
                child:Column(
                  children: [
                    SizedBox(height: 4.h,),
                    Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(height: 2.h,),
                   count==0?SizedBox():Text(count.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                  ],
                )


            ),
          )
        ],
      ),
    );
  }
}
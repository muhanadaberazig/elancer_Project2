import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class Favourites extends StatelessWidget {
  String title;
  String imageUrl;

  Favourites({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    const Text('A52',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    const Text('Samsung',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('\$950',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        Text('\$1100',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,decoration: TextDecoration.lineThrough),),
                      ],
                    ),
                  ],

                ),

              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(onPressed: (){},icon: Icon(Icons.favorite_outline,color: HexColor('#36596A'),),))
      ],


    );
  }
}
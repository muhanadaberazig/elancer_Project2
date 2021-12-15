import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class Favourites extends StatelessWidget {
  String title;
  String imageUrl;
  int price;
  int quantity;


  Favourites({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return
      Stack(
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
                    Container(
                      height: 110,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                     Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    // SizedBox(height: 15.h,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Text(price.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    //     Text(quantity.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                    //   ],
                    // ),
                  ],

                ),

              ),
            ),
          ],
        ),
      ],


    );
  }
}
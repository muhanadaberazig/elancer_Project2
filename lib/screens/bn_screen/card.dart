import 'dart:convert';

import 'package:elancer_api/api/controllers/api_favorite_products_controler.dart';
import 'package:elancer_api/get/faverite_gtex_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  late List<dynamic> cartItems = [];
  List<int> cartItemCount = [1, 1, 1, 1];
  int totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FaveriteGetxControler.to.getFaverite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2d3447),
        body: Obx(() {
          return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: !FaveriteGetxControler.to.loadingsupCategory.value &&
                      FaveriteGetxControler.to.supCategory.isNotEmpty
                  ? ListView.builder(
                      itemCount: FaveriteGetxControler.to.supCategory.length,
                      itemBuilder: (context, index) {
                        return
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Dismissible(
                              background: const Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              key: UniqueKey(),
                              onDismissed: (direction) async {
                                ApiFavoriteProductController().addFaverite(
                                    context,
                                    id: FaveriteGetxControler
                                        .to.supCategory.value[index].id
                                        .toString());
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: HexColor('#36596A'),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: ListTile(
                                    title: Text(FaveriteGetxControler
                                        .to.supCategory[index].nameEn),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        FaveriteGetxControler
                                            .to.supCategory[index].imageUrl,
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    selectedTileColor: Colors.red,
                                  ),
                                ),
                              )),
                          );
                      },
                    )
                  : !FaveriteGetxControler.to.loadingsupCategory.value &&
                          FaveriteGetxControler.to.supCategory.isEmpty
                      ? Center(
                          child: Column(
                            children: const [
                              Icon(Icons.warning, size: 80),
                              Text(
                                'NO DATA',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        )
                      : Center(child: CircularProgressIndicator()));
        }));
  }

// cartItem() {
//   return Slidable(
//     endActionPane: ActionPane(
//       motion: const ScrollMotion(),
//       dismissible: DismissiblePane(
//         onDismissed: () {},
//       ), children: [],
//     ),
//     child: GestureDetector(
//       onTap: () {
//       },
//         child: Dismissible(
//           background: Container(
//             height: 10,
//               width: 10,
//               decoration: BoxDecoration(
//                 color: HexColor('#36596A'),
//                 borderRadius: BorderRadius.circular(30),
//                 // boxShadow: const [
//                 //   BoxShadow(
//                 //     color: Colors.black,
//                 //     offset: Offset(0, 2),
//                 //     blurRadius: 6,
//                 //   ),
//                 // ],
//               ),
//               child: Icon(Icons.clear,color: Colors.red,)),
//
//           key: UniqueKey(),
//           child: Container(
//             height: 150,
//             width: 500,
//             margin: EdgeInsets.only(bottom: 20),
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: HexColor('#36596A'),
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black,
//                   offset: Offset(0, 2),
//                   blurRadius: 6,
//                 ),
//               ],
//             ),
//             child:Row(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(right: 10),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         'images/a52.jpg',
//                         fit: BoxFit.cover,
//                         height: 100,
//                         width: 100,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           const Padding(
//                             padding: EdgeInsets.only(top: 30),
//                             child: Text('Samsung', style: TextStyle(
//                               color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
//                           ),
//                           const SizedBox(height: 5,),
//                           const Text('A52',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             '1350',
//                             // '\$${product.price}',
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.grey.shade800,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                         ]
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       MaterialButton(
//                         minWidth: 10,
//                         padding: EdgeInsets.all(0),
//                         onPressed: () {
//                           setState(() {
//                             // if (cartItemCount[index] > 1) {
//                             //   cartItemCount[index]--;
//                             //   totalPrice = totalPrice - product.price;
//                             // }
//                           });
//                         },
//                         shape: CircleBorder(),
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 20),
//                           child: Icon(Icons.remove_circle_outline,
//                             color: Colors.grey.shade400, size: 30,),
//                         ),
//                       ),
//                       // cartItemCount[index].toString()
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Center(
//                           child: Text(
//                           '5',
//                             style: TextStyle(
//                           fontSize: 20, color: Colors.grey.shade800),),),
//                       ),
//                       MaterialButton(
//                         padding: EdgeInsets.all(0),
//                         minWidth: 10,
//                         splashColor: Colors.yellow[700],
//                         onPressed: () {
//                           setState(() {
//                             // cartItemCount[index]++;
//                             // totalPrice = totalPrice + product.price;
//                           });
//                         },
//                         shape: CircleBorder(),
//                         child: Icon(Icons.add_circle, size: 30,),
//                       ),
//                     ],
//                   ),
//                 ]
//             ),
//           ),
//         ),
//       ),
//   );
// }
}

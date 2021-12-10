// import 'package:elancer_api/models/category.dart';
// import 'package:elancer_api/models/prodect.dart';
// import 'package:elancer_api/models/sup_category.dart';
// import 'package:elancer_api/models/widget_category.dart';
// import 'package:elancer_api/screens/prodect_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../api/auth_api_controller.dart';
// import 'categories_screen.dart';
// class NewArrivals extends StatefulWidget {
//    NewArrivals({Key? key,required this.category,required this.title}) : super(key: key);
//    List<SupCat> category;
//    String title;
//   @override
//   _NewArrivalsState createState() => _NewArrivalsState();
// }
//
// class _NewArrivalsState extends State<NewArrivals> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Padding(
//           padding:  EdgeInsets.only(left: 25.w,top: 20.h),
//           child: IconButton(
//             icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
//             onPressed: (){
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         actions: [
//           Padding(
//             padding:  EdgeInsets.only(right: 25.5.w,top: 20.h),
//             child: Icon(Icons.search,color: Colors.black,),
//           )
//         ],
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding:  EdgeInsets.only(top: 28.5.h,left: 25.w),
//             child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
//           ),
//           Padding(
//             padding:  EdgeInsets.only(top: 14.5.h,left: 15.w,right: 25.w),
//             child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 200,
//                   crossAxisSpacing: 5,
//                   childAspectRatio: 155/170,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount:widget.category.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return InkWell(
//                     // onTap: () {
//                     //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(productt: widget.category[index]),));
//                     // },
//                       child: NewWidget(image:widget.category[index].image,title: widget.category[index].title, id: 10,));
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
//   Future<void> logout(BuildContext context) async {
//     bool loggedOut = await AuthApi().logout();
//     if (loggedOut) Navigator.pushReplacementNamed(context, '/login_screen');
//   }
// }

// import 'package:elancer_api/api/controllers/auth_api_controller.dart';
// import 'package:elancer_api/models/category.dart';
// import 'package:elancer_api/models/sup_category.dart';
// import 'package:elancer_api/models/widget_category.dart';
// import 'package:elancer_api/screens/sup_category.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class CategoriesScreen extends StatefulWidget {
//
//   const CategoriesScreen({Key? key}) : super(key: key);
//
//   @override
//   _CategoriesScreenState createState() => _CategoriesScreenState();
// }
//
// class _CategoriesScreenState extends State<CategoriesScreen> {
//
//   List<Category> _category = [];
//
//   void getdata() {
//     _category.add(Category(
//         id: 1,
//         title: 'New Arrivals ',
//         image: 'images/a.png',
//         list: _listnew,
//         count: _listnew.length));
//     _category.add(Category(
//         id: 2,
//         title: 'Samsung ',
//         image: 'images/sss.gif',
//         list: _listsam,
//         count: _listsam.length));
//     _category.add(Category(
//         id: 3,
//         title: 'Xiaomi ',
//         image: 'images/xiomi2.png',
//         list: _listxiaomi,
//         count: _listxiaomi.length));
//     _category.add(Category(
//         id: 4,
//         title: 'HUAWEI  ',
//         image: 'images/1344920.jpg',
//         list: _listhaw,
//         count: _listhaw.length));
//     _category.add(Category(
//         id: 5,
//         title: 'Apple ',
//         image: 'images/apple.jpg',
//         list: _list2apple,
//         count: _list2apple.length));
//     _category.add(Category(
//         id: 6,
//         title: 'smart watches ',
//         image: 'images/smart-watch.png',
//         list: _listwat,
//         count: _listwat.length));
//   }
//
//   List<SupCat> _listnew = [];
//
//   void gdatanew() {
//     _listnew.add(SupCat(
//       'New',
//       'description',
//       'images/a.png',
//       'd',
//       'd',
//       'd',
//       'd',
//       '1000',
//       'd',
//     ));
//     _listnew.add(SupCat(
//       'Samsung',
//       'description',
//       'images/a.png',
//       'd',
//       'd',
//       'd',
//       'd',
//       '1000',
//       'd',
//     ));
//     _listnew.add(SupCat(
//       'xiaomi',
//       'description',
//       'images/a.png',
//       'd',
//       'd',
//       'd',
//       'd',
//       '1000',
//       'd',
//     ));
//     _listnew.add(SupCat(
//       'Hawa',
//       'description',
//       'images/a.png',
//       'd',
//       'd',
//       'd',
//       'd',
//       '1000',
//       'd',
//     ));
//     _listnew.add(SupCat(
//       'Smart',
//       'description',
//       'images/a.png',
//       'd',
//       'd',
//       'd',
//       'd',
//       '1000',
//       'd',
//     ));
//   }
//
//   List<SupCat> _listsam = [];
//
//   void gdatasam() {
//     _listsam.add(SupCat(
//         'A72',
//         'Samsung',
//         'images/a522.jpg',
//         '64 MP / 12MP / 5MP / 5 MP',
//         '6.5 Inches',
//         '5000',
//         'Adreno 615',
//         '\$1650',
//         'Samsung'));
//     _listsam.add(SupCat(
//         'A52',
//         'Samsung',
//         'images/a522.jpg',
//         '64 MP / 12MP / 5MP / 5 MP',
//         '6.5 Inches',
//         '5000',
//         'Adreno 615',
//         '\$1350',
//         'Samsung'));
//     _listsam.add(SupCat(
//         'A32',
//         'Samsung',
//         'images/a522.jpg',
//         '64 MP / 12MP / 5MP / 5 MP',
//         '6.5 Inches',
//         '5000',
//         'Adreno 615',
//         '\$950',
//         'Samsung'));
//     _listsam.add(SupCat(
//         'A22',
//         'Samsung',
//         'images/a522.jpg',
//         '64 MP / 12MP / 5MP / 5 MP',
//         '6.5 Inches',
//         '5000',
//         'Adreno 615',
//         '\$800',
//         'Samsung'));
//     _listsam.add(SupCat(
//         'A12',
//         'Samsung',
//         'images/a522.jpg',
//         '64 MP / 12MP / 5MP / 5 MP',
//         '6.5 Inches',
//         '5000',
//         'Adreno 615',
//         '\$650',
//         'Samsung'));
//     _listsam.add(SupCat(
//         'A12',
//         'Samsung',
//         'images/a522.jpg',
//         '64 MP / 12MP / 5MP / 5 MP',
//         '6.5 Inches',
//         '5000',
//         'Adreno 615',
//         '\$650',
//         'Samsung'));
//   }
//
//   List<SupCat> _listxiaomi = [];
//
//   void gdataxiaomi() {
//     _listxiaomi.add(SupCat(
//         'Mi 11 late',
//         'description',
//         'images/xiaomi_mi_11-15.jpg',
//         '64 MP / 8MP / 5MP ',
//         '6.55 Inches',
//         '4250',
//         'Snapdragon',
//         '\$1350',
//         'Xiaomi'));
//     _listxiaomi.add(SupCat(
//         'Note 10 Pro Max',
//         'description',
//         'images/xiaomi_mi_11-15.jpg',
//         '64 MP / 8MP / 5MP ',
//         '6.55 Inches',
//         '4250',
//         'Snapdragon',
//         '\$1350',
//         'Xiaomi'));
//     _listxiaomi.add(SupCat(
//         'Note 10',
//         'description',
//         'images/xiaomi_mi_11-15.jpg',
//         '64 MP / 8MP / 5MP ',
//         '6.55 Inches',
//         '4250',
//         'Snapdragon',
//         '\$1350',
//         'Xiaomi'));
//     _listxiaomi.add(SupCat(
//         'Note 9',
//         'description',
//         'images/xiaomi_mi_11-15.jpg',
//         '64 MP / 8MP / 5MP ',
//         '6.55 Inches',
//         '4250',
//         'Snapdragon',
//         '\$1350',
//         'Xiaomi'));
//     _listxiaomi.add(SupCat(
//         'Note 8',
//         'description',
//         'images/xiaomi_mi_11-15.jpg',
//         '64 MP / 8MP / 5MP ',
//         '6.55 Inches',
//         '4250',
//         'Snapdragon',
//         '\$1350',
//         'Xiaomi'));
//     _listxiaomi.add(SupCat(
//         'Redmi 9',
//         'description',
//         'images/xiaomi_mi_11-15.jpg',
//         '64 MP / 8MP / 5MP ',
//         '6.55 Inches',
//         '4250',
//         'Snapdragon',
//         '\$1350',
//         'Xiaomi'));
//   }
//
//   List<SupCat> _list2apple = [];
//
//   void gdataapple() {
//     _list2apple.add(SupCat('iphone 13', 'Apple', 'images/iphone1.jpg', '85',
//         '6.7 Inches', '5000', 'Apple A15 Bionic', '\$6550', 'Apple'));
//     _list2apple.add(SupCat('iphone 13', 'Apple', 'images/iphone1.jpg', '85',
//         '6.7 Inches', '5000', 'Apple A15 Bionic', '\$6550', 'Apple'));
//     _list2apple.add(SupCat('iphone 13', 'Apple', 'images/iphone1.jpg', '85',
//         '6.7 Inches', '5000', 'Apple A15 Bionic', '\$6550', 'Apple'));
//     _list2apple.add(SupCat('iphone 13', 'Apple', 'images/iphone1.jpg', '85',
//         '6.7 Inches', '5000', 'Apple A15 Bionic', '\$6550', 'Apple'));
//     _list2apple.add(SupCat('iphone 13', 'Apple', 'images/iphone1.jpg', '85',
//         '6.7 Inches', '5000', 'Apple A15 Bionic', '\$6550', 'Apple'));
//     _list2apple.add(SupCat('iphone 13', 'Apple', 'images/iphone1.jpg', '85',
//         '6.7 Inches', '5000', 'Apple A15 Bionic', '\$6550', 'Apple'));
//   }
//
//   List<SupCat> _listhaw = [];
//
//   void gdatahaw() {
//     _listhaw.add(SupCat('Haw', 'description', 'images/huawei1.jpg', '85',
//         'screen', '5000', 'cpu', '50', 'sa'));
//     _listhaw.add(SupCat('Haw', 'description', 'images/huawei1.jpg', '85',
//         'screen', '5000', 'cpu', '50', 'sa'));
//     _listhaw.add(SupCat('Haw', 'description', 'images/huawei1.jpg', '85',
//         'screen', '5000', 'cpu', '50', 'sa'));
//     _listhaw.add(SupCat('Haw', 'description', 'images/huawei1.jpg', '85',
//         'screen', '5000', 'cpu', '50', 'sa'));
//     _listhaw.add(SupCat('Haw', 'description', 'images/huawei1.jpg', '85',
//         'screen', '5000', 'cpu', '50', 'sa'));
//     _listhaw.add(SupCat('Haw', 'description', 'images/huawei1.jpg', '85',
//         'screen', '5000', 'cpu', '50', 'sa'));
//   }
//
//   List<SupCat> _listwat = [];
//
//   void gdatawat() {
//     _listwat.add(SupCat('smart', 'description', 'images/a.png', '85', 'screen',
//         '5000', 'cpu', '50', 'sa'));
//     _listwat.add(SupCat('smart', 'description', 'images/a.png', '85', 'screen',
//         '5000', 'cpu', '50', 'sa'));
//     _listwat.add(SupCat('smart', 'description', 'images/a.png', '85', 'screen',
//         '5000', 'cpu', '50', 'sa'));
//     _listwat.add(SupCat('smart', 'description', 'images/a.png', '85', 'screen',
//         '5000', 'cpu', '50', 'sa'));
//     _listwat.add(SupCat('smart', 'description', 'images/a.png', '85', 'screen',
//         '5000', 'cpu', '50', 'sa'));
//     _listwat.add(SupCat('smart', 'description', 'images/a.png', '85', 'screen',
//         '5000', 'cpu', '50', 'sa'));
//   }
//
//   @override
//   void initState() {
//     gdatahaw();
//     gdatawat();
//     getdata();
//     gdataapple();
//     gdatanew();
//     gdataxiaomi();
//     gdatasam();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 25.w, top: 24.h),
//             child: Text(
//               'welcome,',
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: Text(
//               'Our rica Mobile app',
//               style: TextStyle(fontSize: 20, color: HexColor('#666666')),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 20.h, left: 25.w, right: 25.w),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: HexColor('#F3F4F5'),
//                   borderRadius: BorderRadius.circular(30)),
//               child: TextField(
//                 decoration: InputDecoration(
//                   focusColor: HexColor('#F3F4F5'),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Colors.black,
//                   ),
//                   labelText: 'Search Categories',
//                   labelStyle:
//                       TextStyle(fontSize: 13, color: HexColor('#AAAAAA')),
//                   enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: HexColor('#F3F4F5')),
//                       borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 28.5.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 24.w),
//                 child: const Text(
//                   'Categories',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 24.w),
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text('View All >',
//                       style:
//                           TextStyle(fontSize: 14, color: HexColor('#666666'))),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 14.5.h,
//           ),
//           Container(
//             height: 160.h,
//             child: GridView.builder(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   childAspectRatio: 160 / 240,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 5,
//                 ),
//                 itemBuilder: (context, index) {
//                   return NewWidget(
//                       image: 'images/sss.gif', id: 1, title: 'Samsunge');
//                 }),
//           ),
//           Container(
//             height: 220.h,
//             child: Padding(
//               padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 25.w),
//               child: GridView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 200,
//                     crossAxisSpacing: 10,
//                     childAspectRatio: 155 / 170,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: _category.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return InkWell(
//                         onTap: () {
//                           // Navigator.pushReplacementNamed(context, '/product_screen');
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => NewArrivals(
//                                   category: _category[index].list,
//                                   title: _category[index].title,
//                                 ),
//                               ));
//                         },
//                         child: NewWidget(
//                           image: _category[index].image,
//                           title: _category[index].title,
//                           id: _category[index].id,
//                           count: _category[index].list.length,
//                         ));
//                   }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> logout(BuildContext context) async {
//     bool loggedOut = await AuthApiController().logout();
//     if (loggedOut) Navigator.pushReplacementNamed(context, '/login_screen');
//   }
// }
// // Container(
// // height: 160.h,
// // child: GridView.builder(
// // padding: EdgeInsets.symmetric(horizontal: 20),
// // shrinkWrap: true,
// // scrollDirection: Axis.horizontal,
// // itemCount: 10,
// // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // crossAxisCount: 1,
// // childAspectRatio: 160 / 240,
// // crossAxisSpacing: 5,
// // mainAxisSpacing: 5,
// // ),
// // itemBuilder: (context, index) {
// // return NewWidget(
// // image: 'images/sss.gif', id: 1, title: 'Samsunge');
// // }),
// // ),

// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:scound_project_elancer/Them/colors.dart';
// import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
// import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
// import 'package:scound_project_elancer/get/author_getx_controller.dart';
// import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
// import 'package:scound_project_elancer/helpers/helpers.dart';
// import 'package:scound_project_elancer/model/city.dart';
// import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';
// import 'package:scound_project_elancer/widgets/app_text_field.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen>with Helpers {
//   late TextEditingController _userNametextEditingController;
//   late TextEditingController _passwordtextEditingController;
//
//   @override
//   void initState() {
//     _userNametextEditingController = TextEditingController();
//     _passwordtextEditingController = TextEditingController();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _userNametextEditingController.dispose();
//     _passwordtextEditingController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: color2,
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: 28.w),
//         children: [
//           SizedBox(
//             height: 50.h,
//           ),
//           Container(height: 237.h,width: 227.w,child: Image.asset("image/loginImage.png"),),
//           // Container(
//           //   margin: EdgeInsets.only(top: 40.h),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //     children: [
//           //       CircleAvatar(
//           //         radius: 19.w,
//           //         child: Icon(
//           //           Icons.clear,
//           //           color: color1,
//           //         ),
//           //         backgroundColor: color3.withOpacity(.2),
//           //       ),
//           //       Container(
//           //           child: Text(AppLocalizations.of(context)!.forgotcreden)),
//           //     ],
//           //   ),
//           // ),
//           SizedBox(
//             height: 28.h,
//           ),
//           Text(
//             AppLocalizations.of(context)!.welcomeback,
//             style: TextStyle(
//                 color: color1, fontSize: 22.sp, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 8.h,
//           ),
//           Text(AppLocalizations.of(context)!.welcomebacksub,
//               style: TextStyle(color: color3, fontSize: 14.sp)),
//           SizedBox(
//             height: 30.h,
//           ),
//           Text(
//             "Phone Number",
//             style: TextStyle(fontSize: 12.sp, color: color3),
//           ),
//           SizedBox(
//             height: 7.h,
//           ),
//           AppTextField(
//             prefixIcon: Icons.person_outline,
//             textEditingController: _userNametextEditingController,
//             hint: "599999999",
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           Text(
//             AppLocalizations.of(context)!.password,
//             style: TextStyle(fontSize: 12.sp, color: color3),
//           ),
//           SizedBox(
//             height: 7.h,
//           ),
//           AppTextField(
//             prefixIcon: Icons.lock_outline,
//             textEditingController: _passwordtextEditingController,
//             hint: "********",
//           ),
//           SizedBox(
//             height: 18.h,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).pushNamed("/forget_password_screen");
//             },
//             child: Text(
//               AppLocalizations.of(context)!.forgetpass,
//               style: TextStyle(fontSize: 14.sp, color: color1),
//             ),
//           ),
//           SizedBox(
//             height: 48.h,
//           ),
//           ElevatedButton(
//             onPressed: ()async => await performLogin(),
//             child: Text(
//               AppLocalizations.of(context)!.login,
//               style: TextStyle(
//                 fontSize: 12.sp,
//               ),
//             ),
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(0, 60.h),
//               primary: color1,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(30.w)),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 18.h,
//           ),
//           InkWell(
//               onTap: () {
//                 Navigator.of(context).pushNamed("/register_screen");
//               },
//               child: Center(
//                 child: Text("register Now",style: TextStyle(color: Colors.blue),),
//               ))
//         ],
//       ),
//     );
//   }
//   Future<void> performLogin() async {
//     if (checkData()) {
//       await login();
//     }
//   }
//
//   bool checkData() {
//     if (_userNametextEditingController.text.isNotEmpty &&
//         _passwordtextEditingController.text.isNotEmpty) {
//       return true;
//     }
//     showSnackBar(
//       context: context,
//       message: 'Enter required data!',
//       error: true,
//     );
//     return false;
//   }
//
//   Future<void> login() async {
//     bool status = await AuthApiController().login(
//       context,
//       email: _userNametextEditingController.text,
//       password: _passwordtextEditingController.text,
//     );
//     if (status){
//       final AllDataGetxControler _allDataGetxControler = Get.put<AllDataGetxControler>(AllDataGetxControler());
//       Navigator.pushReplacementNamed(context, '/home_screen');}
//   }
//
// }

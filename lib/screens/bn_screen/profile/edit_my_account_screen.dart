// import 'package:elancer_api/helpers/helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class EditMyAccountScreen extends StatefulWidget {
//   const EditMyAccountScreen({Key? key}) : super(key: key);
//
//   @override
//   _EditMyAccountScreenState createState() => _EditMyAccountScreenState();
// }
//
// class _EditMyAccountScreenState extends State<EditMyAccountScreen>
//     with Helpers {
//   late TextEditingController _userNametextEditingController;
//   late TextEditingController currentPasswordEditingController;
//   late TextEditingController newPasswordEditingController;
//   late TextEditingController confirmationPasswordEditingController;
//   // String _gender = SharedPrefController().gender;
//   // String fullname = SharedPrefController().fullName;
//
//   // String fullname = SharedPrefController().fullName;
//
//   List<String> items = [];
//   late String dropdownvalue;
//
//   String indexcity = "1";
//   bool changePass = false;
//
//   // void getData() {
//   //   for (int i = 0; i < CityrGetxController.to.city.value.length; i++) {
//   //     items.add(CityrGetxController.to.city.value[i].nameEn);
//   //   }
//   //   //  dropdownvalue=items[0];
//   // }
//
//   @override
//   void initState() {
//     dropdownvalue = SharedPrefController().cityName;
//     // getData();
//     _userNametextEditingController = TextEditingController();
//     currentPasswordEditingController = TextEditingController();
//     newPasswordEditingController = TextEditingController();
//     confirmationPasswordEditingController = TextEditingController();
//     // _userNametextEditingController.text = fullname;
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _userNametextEditingController.dispose();
//     currentPasswordEditingController.dispose();
//     newPasswordEditingController.dispose();
//     confirmationPasswordEditingController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 28.w),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 55.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                           //  margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
//                           height: 38.h,
//                           width: 38.w,
//                           decoration: BoxDecoration(
//                               color: color1,
//                               borderRadius: BorderRadius.circular(19.w)),
//                           child: Icon(Icons.arrow_back_ios)),
//                     ),
//                     Text("Edit My Account"),
//                     Container(
//                       //    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
//                       height: 38.h,
//                       width: 38.w,
//                       decoration: BoxDecoration(
//                           //   border: Border.all(width: 1.w, color: Colors.grey),
//                           borderRadius: BorderRadius.circular(19.w)),
//                       // child: const Center(child: Icon(Icons.more_vert)),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 52.h,
//               ),
//               Container(
//                 child: Text(
//                   "Personal Information",
//                   style: TextStyle(
//                       color: Colors.amber,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20.sp),
//                 ),
//               ),
//               SizedBox(
//                 height: 27.h,
//               ),
//               Text(
//                 "Full Name",
//                 style: TextStyle(fontSize: 12.sp, color: Colors.white),
//               ),
//               SizedBox(
//                 height: 7.h,
//               ),
//               // AppTextField(
//               //   prefixIcon: Icons.person_outline,
//               //   color: color1,
//               //   textEditingController: _userNametextEditingController,
//               //   hint: "",
//               // ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 10.w), child: Text("Gender")),
//               Row(
//                 children: [
//                   Expanded(
//                     child: RadioListTile<String>(
//                       title: const Text('Male'),
//                       contentPadding: EdgeInsets.zero,
//                       value: 'M',
//                       groupValue: _gender,
//                       onChanged: (String? value) {
//                         if (value != null) {
//                           setState(() {
//                             _gender = value;
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile<String>(
//                       title: const Text('Female'),
//                       contentPadding: EdgeInsets.zero,
//                       value: 'F',
//                       groupValue: _gender,
//                       onChanged: (String? value) {
//                         if (value != null) {
//                           setState(() {
//                             _gender = value;
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Text(
//                 "City",
//                 style: TextStyle(fontSize: 12.sp, color: Colors.amber),
//               ),
//              !CityrGetxController.to.loading.value?DropdownButton(
//                 value: dropdownvalue,
//                 icon: Icon(Icons.keyboard_arrow_down),
//                 underline: SizedBox(),
//                 items: items.map((String items) {
//                   return DropdownMenuItem(value: items, child: Text(items));
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     dropdownvalue = value.toString();
//                     for (int i = 0; i < items.length; i++) {
//                       if (dropdownvalue == items[i]) {
//                         int j = i + 1;
//                         setState(() {
//                           indexcity = j.toString();
//                           print("city selected " + indexcity);
//                         });
//                       }
//                     }
//                   });
//                 },
//               ):CircularProgressIndicator(),
//               SizedBox(
//                 height: 5.h,
//               ),
//               !changePass
//                   ? ListTile(
//                       title: Text(
//                         "Do you want to change the password",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700, fontSize: 11.sp),
//                       ),
//                       trailing: InkWell(
//                           onTap: () {
//                             setState(() {
//                               changePass = true;
//                             });
//                           },
//                           child: Text(
//                             "Click here",
//                             style: TextStyle(color: Colors.blue),
//                           )),
//                     )
//                   : ListView(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         // AppTextField(
//                         //   prefixIcon: Icons.lock_outlined,
//                         //   color: color1,
//                         //   textEditingController:
//                         //       currentPasswordEditingController,
//                         //   hint: "current Password",
//                         // ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         // AppTextField(
//                         //   prefixIcon: Icons.lock_outlined,
//                         //   color: color1,
//                         //   textEditingController: newPasswordEditingController,
//                         //   hint: "new Password",
//                         // ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         // AppTextField(
//                         //   prefixIcon: Icons.lock_outlined,
//                         //   color: color1,
//                         //   textEditingController:
//                         //       confirmationPasswordEditingController,
//                         //   hint: "confirmation Password",
//                         // ),
//                       ],
//                     ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               Container(
//                 margin: EdgeInsets.only(),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   // async => performUpdateProfile(),
//                   child: Text(
//                     "done",
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, 60.h),
//                     primary: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(30.w)),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // bool checkData() {
//   //   if (changePass) {
//   //     if (_userNametextEditingController.text.isNotEmpty &&
//   //         indexcity.isNotEmpty &&
//   //         _gender.isNotEmpty &&
//   //         newPasswordEditingController.text.isNotEmpty &&
//   //         confirmationPasswordEditingController.text.isNotEmpty)
//   //     {
//   //       if(newPasswordEditingController.text==confirmationPasswordEditingController.text)
//   //       {
//   //         return true;
//   //       }
//   //       showSnackBar(
//   //         context: context,
//   //         message: 'Make sure the password matches!',
//   //         error: true,
//   //       );
//   //       return false;
//   //     }
//   //   } else if (_userNametextEditingController.text.isNotEmpty &&
//   //       indexcity.isNotEmpty &&
//   //       _gender.isNotEmpty) {
//   //     return true;
//   //   }
//   //   showSnackBar(
//   //     context: context,
//   //     message: 'Enter required data!',
//   //     error: true,
//   //   );
//   //   return false;
//   // }
//   //
//   // Future<void> performUpdateProfile() async {
//   //    if (checkData()) {
//   //      if(changePass)
//   //      {
//   //        await ChangePasswordAndUptaeProfile();
//   //      }
//   //      else{
//   //       await UpdateProfile();
//   //      }
//   //     }
//   // }
//   //
//   // Future<void> UpdateProfile() async {
//   //   bool status = await UpdateProfileApiController().updateProfile(context,
//   //       name: _userNametextEditingController.text,
//   //       cityId: indexcity,
//   //       gender: _gender);
//   //   if (status) {
//   //     SharedPrefController().updateProfile(
//   //         fullname: _userNametextEditingController.text,
//   //         genderM: _gender,
//   //         cityN: dropdownvalue,
//   //         cityID: indexcity);
//   //     Navigator.pop(context);
//   //   }
//   // }
//   // Future<void> ChangePasswordAndUptaeProfile() async {
//   //   bool statusup = await UpdateProfileApiController().updateProfile(context,
//   //       name: _userNametextEditingController.text,
//   //       cityId: indexcity,
//   //       gender: _gender);
//   //   if (statusup) {
//   //     SharedPrefController().updateProfile(
//   //         fullname: _userNametextEditingController.text,
//   //         genderM: _gender,
//   //         cityN: dropdownvalue,
//   //         cityID: indexcity);
//   //   //  Navigator.pop(context);
//   //     bool status = await UpdateProfileApiController().changePassword(context,
//   //         carantPass: currentPasswordEditingController.text,
//   //         comfirmPass: confirmationPasswordEditingController.text,
//   //         newPass: newPasswordEditingController.text);
//   //     if (status) {
//   //       // SharedPrefController().updateProfile(
//   //       //     fullname: _userNametextEditingController.text,
//   //       //     genderM: _gender,
//   //       //     cityN: dropdownvalue,
//   //       //     cityID: indexcity);
//   //       Navigator.pop(context);
//   //     }
//   //   }
//   //
//   // }
// }

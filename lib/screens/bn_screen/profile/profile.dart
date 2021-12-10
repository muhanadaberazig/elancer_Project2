import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool changePa565ss = false;
  // String _gender = SharedPrefController().gender;
  String _gender = 'M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          backgroundColor: Color(0xFF2d3447),
          elevation: 0,

          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/aboute_screen');
            }, icon:  Icon(Icons.info,size: 30,color: HexColor('#36596A'),))
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color:  Color(0xFF2d3447),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(0.w),
                    bottom: Radius.circular(150.w),
                  )),
              child: Padding(
                padding:  EdgeInsets.only(top: 10.h,bottom: 15.h),
                child: CircleAvatar(
                  radius:100,
                  backgroundColor: HexColor('#36596A'),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/avatar-1.png',),backgroundColor: HexColor('#36596A'),
                    radius: 120,
                  ),
                ),
              ),


            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 55.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              //  margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                                height: 38.h,
                                width: 38.w,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(19.w)),
                                child: Icon(Icons.arrow_back_ios)),
                          ),
                          Text("Edit My Account"),
                          Container(
                            //    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                            height: 38.h,
                            width: 38.w,
                            decoration: BoxDecoration(
                              //   border: Border.all(width: 1.w, color: Colors.grey),
                                borderRadius: BorderRadius.circular(19.w)),
                            // child: const Center(child: Icon(Icons.more_vert)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    Container(
                      child: Text(
                        "Personal Information",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Text(
                      "Full Name",
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    // AppTextField(
                    //   prefixIcon: Icons.person_outline,
                    //   color: color1,
                    //   textEditingController: _userNametextEditingController,
                    //   hint: "",
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.w), child: Text("Gender")),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Male'),
                            contentPadding: EdgeInsets.zero,
                            value: 'M',
                            groupValue: _gender,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  _gender = value;
                                });
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Female'),
                            contentPadding: EdgeInsets.zero,
                            value: 'F',
                            groupValue: _gender,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  _gender = value;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "City",
                      style: TextStyle(fontSize: 12.sp, color: Colors.amber),
                    ),
                    // !CityrGetxController.to.loading.value?DropdownButton(
                    //    value: dropdownvalue,
                    //    icon: Icon(Icons.keyboard_arrow_down),
                    //    underline: SizedBox(),
                    //    items: items.map((String items) {
                    //      return DropdownMenuItem(value: items, child: Text(items));
                    //    }).toList(),
                    //    onChanged: (value) {
                    //      setState(() {
                    //        dropdownvalue = value.toString();
                    //        for (int i = 0; i < items.length; i++) {
                    //          if (dropdownvalue == items[i]) {
                    //            int j = i + 1;
                    //            setState(() {
                    //              indexcity = j.toString();
                    //              print("city selected " + indexcity);
                    //            });
                    //          }
                    //        }
                    //      });
                    //    },
                    //  ):CircularProgressIndicator(),
                    SizedBox(
                      height: 5.h,
                    ),
                    // !changePass
                    //     ? ListTile(
                    //   title: Text(
                    //     "Do you want to change the password",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.w700, fontSize: 11.sp),
                    //   ),
                    //   trailing: InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           changePass = true;
                    //         });
                    //       },
                    //       child: Text(
                    //         "Click here",
                    //         style: TextStyle(color: Colors.blue),
                    //       )),
                    // )
                    //     : ListView(
                    //   physics: NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   children: [
                    //     // AppTextField(
                    //     //   prefixIcon: Icons.lock_outlined,
                    //     //   color: color1,
                    //     //   textEditingController:
                    //     //       currentPasswordEditingController,
                    //     //   hint: "current Password",
                    //     // ),
                    //     SizedBox(
                    //       height: 10.h,
                    //     ),
                    //     // AppTextField(
                    //     //   prefixIcon: Icons.lock_outlined,
                    //     //   color: color1,
                    //     //   textEditingController: newPasswordEditingController,
                    //     //   hint: "new Password",
                    //     // ),
                    //     SizedBox(
                    //       height: 10.h,
                    //     ),
                    //     // AppTextField(
                    //     //   prefixIcon: Icons.lock_outlined,
                    //     //   color: color1,
                    //     //   textEditingController:
                    //     //       confirmationPasswordEditingController,
                    //     //   hint: "confirmation Password",
                    //     // ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(),
                      child: ElevatedButton(
                        onPressed: () {},
                        // async => performUpdateProfile(),
                        child: Text(
                          "done",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60.h),
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.w)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

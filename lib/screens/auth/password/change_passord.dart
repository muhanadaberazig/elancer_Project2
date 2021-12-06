import 'package:elancer_api/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>  with Helpers{
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordnewTextController;
  late TextEditingController _passwordnewconfTextController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordTextController=TextEditingController();
    _passwordnewTextController=TextEditingController();
    _passwordnewconfTextController=TextEditingController();
  }
  @override
  void dispose() {
    _passwordTextController.dispose();
    _passwordnewTextController.dispose();
    _passwordnewconfTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding:EdgeInsets.only(top: 18.h),
          child: const Text('FORGET PASSWORD',style: TextStyle(color: Color(0xFF2d3447)),),
        ),
        centerTitle: true,
        leading:Padding(
          padding: EdgeInsets.only(top: 18.h),
          child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,color: Color(0xFF2d3447),)),
        )
        ,
      ),
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 50.h,left: 15.w),
            child: Text('Enter the old password',style: TextStyle( color: HexColor('#36596A'),fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.only(left: 15.w,right: 15.w),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _passwordTextController,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: border(),
                  focusedBorder: border(borderColor: Colors.black54),
                  //suffixIcon:
                  label: Text('Password',style: TextStyle(fontSize: 16,color: HexColor('#000000')),)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.only(left: 15.w),
            child: Text('Enter New Password',style: TextStyle( color: HexColor('#36596A'),fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.only(left: 15.w,right: 15.w),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _passwordnewTextController,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: border(),
                  focusedBorder: border(borderColor: Colors.black54),
                  //suffixIcon:
                  label: Text('New Password',style: TextStyle(fontSize: 16,color: HexColor('#000000')),)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.only(left: 15.w),
            child: Text('Confirm the new password',style: TextStyle( color: HexColor('#36596A'),fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.only(left: 15.w,right: 15.w),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _passwordnewconfTextController,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: border(),
                  focusedBorder: border(borderColor: Colors.black54),
                  //suffixIcon:
                  label: Text('Password Confirmation',style: TextStyle(fontSize: 16,color: HexColor('#000000')),)
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('SEND CODE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
            style: ElevatedButton.styleFrom(
              primary:  HexColor('#36596A')   ,
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Future<void> performChangePassword() async {
//   if (checkData()) {
//     await changePassword();
//   }
// }
//
// bool checkData() {
//   if (_passwordnewTextController.text.isNotEmpty) {
//     return true;
//   }
//   showSnackBar(
//     context: context,
//     message: 'Enter required data!',
//     error: true,
//   );
//   return false;
// }
//
// Future<void> changePassword() async {
//   bool status = await AuthApiController().forgetPassword(
//     context,
//     email: _emailTextController.text,
//   );
//   if (status) Navigator.pushReplacementNamed(context, '/categories_screen');
// }

OutlineInputBorder border({Color borderColor = Colors.grey}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
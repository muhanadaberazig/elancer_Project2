import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/screens/wdget/code_text_filed.dart';
import 'package:elancer_api/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  String? _code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();

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
        physics: const NeverScrollableScrollPhysics(),
        padding:  EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
        children: [
           Padding(
             padding:  EdgeInsets.only(top: 40.h),
             child: Text(
              'Enter Number Mobile...',
              style: TextStyle(
                color: HexColor('#36596A'),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
          ),
           ),
          SizedBox(height: 5.h),
          const Text(
            'Reset code will be sent!',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20.h),
          AppTextField(
            keyboardType: TextInputType.number,
            hint: 'Mobile',
            controller: _emailTextController,
            prefixIcon: Icons.mobile_friendly, label: 'Mobile',
          ),
           SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: (){
      Navigator.pushNamed(context, '/verification_screen') ;
    },
                //() async => await performForgetPassword(),
            child: const Text('SEND CODE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
            style: ElevatedButton.styleFrom(
             primary:  HexColor('#36596A')   ,
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 50.h),

        ],
      ),
    );
  }

  // Future<void> performForgetPassword() async {
  //   if (checkData()) {
  //     await forgetPassword();
  //   }
  // }
  //
  // bool checkData() {
  //   if (_emailTextController.text.isNotEmpty) {
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
  // Future<void> forgetPassword() async {
  //   bool status = await AuthApiController().forgetPassword(
  //     context,
  //     email: _emailTextController.text,
  //   );
  //   if (status) Navigator.pushReplacementNamed(context, '/verification_screen');
  // }
}

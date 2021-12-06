import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/screens/wdget/code_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../api/auth_api_controller.dart';
class VerificationScreen extends StatefulWidget {
  late String mobile;
   VerificationScreen({Key? key,required this.mobile}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordnewTextController;
  late TextEditingController _passwordnewconfTextController;
  String? _code;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordTextController=TextEditingController();
    _passwordnewTextController=TextEditingController();
    _passwordnewconfTextController=TextEditingController();
    _emailTextController = TextEditingController();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordTextController.dispose();
    _passwordnewTextController.dispose();
    _passwordnewconfTextController.dispose();
    _emailTextController.dispose();
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
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
          SizedBox(height: 80.h),
          Padding(
            padding:  EdgeInsets.only(left: 15.w),
            child: Text(
              'Enter The Code Please...!!',
              style: TextStyle(
                color: HexColor('#36596A'),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding:EdgeInsets.only(left: 15.w),
            child: const Text(
              'Enter the code that came to the phone!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding:  EdgeInsets.only(left: 15.w,right: 15.w),
            child: Row(
              children: [
                Expanded(
                  child: CodeTextFiled(
                    textEditingController: _firstCodeTextController,
                    focusNode: _firstFocusNode,
                    onChange:
                    /*ه*/
                        (value) {
                      if (value.isNotEmpty) {
                        _secondFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: CodeTextFiled(
                    textEditingController: _secondCodeTextController,
                    focusNode: _secondFocusNode,
                    onChange: (value) {
                      if (value.isNotEmpty) {
                        _thirdFocusNode.requestFocus();
                      } else {
                        _firstFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: CodeTextFiled(
                    textEditingController: _thirdCodeTextController,
                    focusNode: _thirdFocusNode,
                    onChange: (value) {
                      if (value.isNotEmpty) {
                        _fourthFocusNode.requestFocus();
                      } else {
                        _secondFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: CodeTextFiled(
                    textEditingController: _fourthCodeTextController,
                    focusNode: _fourthFocusNode,
                    onChange: (value) {
                      if (value.isEmpty) {
                        _thirdFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 30.h),
          // Padding(
          //   padding:  EdgeInsets.only(left: 15.w),
          //   child: Text(' The new password',style: TextStyle( color: HexColor('#36596A'),fontSize: 18,fontWeight: FontWeight.bold),),
          // ),
          // SizedBox(height: 20.h,),
          // Padding(
          //   padding:  EdgeInsets.only(left: 15.w,right: 15.w),
          //   child: TextField(
          //     keyboardType: TextInputType.text,
          //     controller: _passwordnewconfTextController,
          //     obscureText: true,
          //     decoration: InputDecoration(
          //         enabledBorder: border(),
          //         focusedBorder: border(borderColor: Colors.black54),
          //         //suffixIcon:
          //         label: Text('Password ',style: TextStyle(fontSize: 16,color: HexColor('#000000')),)
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20.h,),
          // Padding(
          //   padding:  EdgeInsets.only(left: 15.w),
          //   child: Text('Confirm the new password',style: TextStyle( color: HexColor('#36596A'),fontSize: 18,fontWeight: FontWeight.bold),),
          // ),
          // SizedBox(height: 20.h,),
          // Padding(
          //   padding:  EdgeInsets.only(left: 15.w,right: 15.w),
          //   child: TextField(
          //     keyboardType: TextInputType.text,
          //     controller: _passwordnewconfTextController,
          //     obscureText: true,
          //     decoration: InputDecoration(
          //         enabledBorder: border(),
          //         focusedBorder: border(borderColor: Colors.black54),
          //         //suffixIcon:
          //         label: Text('Password Confirmation',style: TextStyle(fontSize: 16,color: HexColor('#000000')),)
          //     ),
          //   ),
          // ),
          // SizedBox(height: 50.h,),
          Padding(
            padding:  EdgeInsets.only(left: 15.w,right: 15.w,top: 20),
            child: ElevatedButton(
              onPressed: () async => await performResetPassword(),
              child: const Text('VERIFICATION',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
              style: ElevatedButton.styleFrom(
                primary:  HexColor('#36596A'),
                minimumSize: const Size(0, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> performResetPassword() async {
    if (checkCode()) {
      await resetPassword();
    }
  }
  Future<void> resetPassword() async {
    bool status = await AuthApi().activePhone(
      context,
      mobile: widget.mobile,
      code: _code!,
    );
    if (status) Navigator.of(context).pushNamed("/login_screen");
  }
  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      getVerificationCode();
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter verification code',
      error: true,
    );
    return false;
  }
  String getVerificationCode() {
    return _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
  }
}
OutlineInputBorder border({Color borderColor = Colors.grey}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

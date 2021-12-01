import 'package:elancer_api/api/controllers/auth_api_controller.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/widgets/app_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/controllers/auth_api_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = navigateToRegisterScreen;
    // _tapGestureRecognizer.onTap = navigateToRegisterScreen;
  }

  void navigateToRegisterScreen() {
    Navigator.pushNamed(context, '/register_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height:250.h ,
            width:304.w ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 110.w,right: 108.w,top: 60.h),
                  child: Image.asset('images/logo.png'),
                ),
              Padding(
                padding: EdgeInsets.only(left: 26.w,right: 248.w,top: 46.h),
                child: Text('Welcome!',textAlign: TextAlign.left,style: TextStyle(color: HexColor('#36596A'),fontSize: 20),),
              ),
             Padding(
               padding:EdgeInsets.only(left: 25.w,right: 46.w,top: 1),
               child: Text('please login or sign up to continue our app',style: TextStyle(fontSize: 14),),
             ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 45.h,left: 24.w,right: 24.w),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _emailTextController,
              decoration: InputDecoration(
                enabledBorder: border(),
                focusedBorder: border(borderColor: Colors.black54),
                //suffixIcon:
                label: Text('Email',style: TextStyle(fontSize: 16,color: HexColor('#000000')),)
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 14.h,left: 24.w,right: 24.w),
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
          Padding(
            padding: const EdgeInsets.only(left: 200,top: 0),
            child: TextButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/forget_password_screen');
            },
                child: Text('I forgot my password !',style: TextStyle(fontSize: 15,color: HexColor('#36596A') ),)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.h),
            child: TextButton(onPressed: (){},
                child: Container(
                    decoration: BoxDecoration(
                        color:  Colors.black,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    height: 50.h,
                    width: 325.w,
                    child: TextButton(onPressed: () async => await performLogin(),
                      // {
                    //   Navigator.pushNamed(context, '/register_screen');
                    // },
                        child:const Text('Login',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)))),
          ),
           SizedBox(height: 20.h,),
           Divider(
            endIndent: 10,
            indent: 10,
            thickness: 2,
            color: HexColor('#EEEEEE'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: TextButton(onPressed: (){},
                child: Container(
                    decoration: BoxDecoration(
                        color:  HexColor('#36596A'),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    height: 50.h,
                    width: 325.w,
                    child: TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/register_screen');
                    },
                      child:const Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)))),
          ),

        ],
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      mobile: _emailTextController.text,
      password: _passwordTextController.text,
    );
    if (status) Navigator.pushReplacementNamed(context,  '/categories_screen');
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

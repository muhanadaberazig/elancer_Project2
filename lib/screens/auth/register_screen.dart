import 'package:elancer_api/api/controllers/auth_api_controller.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/student.dart';
import 'package:elancer_api/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _fullNameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  String _select = 'M';
  String _selected ='a';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Container(
            height:260.h ,
            width:304.w ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 110.w,right: 108.w,top: 60.h),
                  child: Image.asset('images/logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 26.w,right: 220.w,top: 46.h),
                  child: Text('Sign Up',textAlign: TextAlign.left,style: TextStyle(color: HexColor('#36596A'),fontSize: 20),),
                ),
                Padding(
                  padding:EdgeInsets.only(left: 25.w,right: 46.w,top: 1),
                  child: Text('Create an new acount',style: TextStyle(fontSize: 14,color: HexColor('#666666')),),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          AppTextField(
            label:'User Name' ,
            hint: 'User Name',
            controller: _fullNameTextController,
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 10),
          AppTextField(
            label: 'Mobile',
            hint: 'Mobile',
            controller: _emailTextController,
            prefixIcon: Icons.mobile_friendly,
          ),
          const SizedBox(height: 10),
          AppTextField(
            label: 'Password',
            hint: 'Password',
            controller: _passwordTextController,
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          AppTextField(
            label: 'Confirm Password',
            hint: 'Confirm Password',
            controller: _passwordTextController,
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: Text('Male',style: TextStyle(color: HexColor('#36596A')),),
                  contentPadding: EdgeInsets.zero,
                  value: 'M',
                  groupValue: _select,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _select = value;
                      });
                    }
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title:  Text('Female',style: TextStyle(color: HexColor('#36596A'))),
                  contentPadding: EdgeInsets.zero,
                  value: 'F',
                  groupValue: _select,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _select = value;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 22.h),
          RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: Text('By creating an account you have to agree with our them & conduction.',style: TextStyle(color: HexColor('#AAAAAA'),fontSize: 15),),
              value: '',
              groupValue: _selected,
              onChanged: (String? value) {
                if (value != null)
                  setState(() {
                    _selected = value;
                  });
              }),
           SizedBox(height: 32.h),
          Container(
            height: 50.h,
            width: 325.w,
            decoration: BoxDecoration(
                color: Colors.black,
              borderRadius: BorderRadius.circular(30)
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/loginsignup_screen');
              },
              child: const Text('Login',style: TextStyle(fontSize: 16,color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

  Future<void> performRegister() async {
    if(checkData()){
      await register();
    }
  }

  bool checkData() {
    if (_fullNameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
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

  Future<void> register() async {
    bool status = await AuthApiController().register(context, student: student);
    if(status) Navigator.pop(context);
  }

  Student get student {
    Student student = Student();
    student.fullName = _fullNameTextController.text;
    student.email = _emailTextController.text;
    student.passsword = _passwordTextController.text;
    student.gender = _select;
    return student;
  }
}

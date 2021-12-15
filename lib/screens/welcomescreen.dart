import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(height: 15.h,),
              Text('Successful!!!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: HexColor('#36596A')),),
              SizedBox(height: 15.h,),
              const Text('You have Successfully in regitered in \n     our app and start working in it.',),
              SizedBox(height: 250.h,),
              Container(
                height: 50.h,
                width: 325.w,
                decoration: BoxDecoration(
                    color: HexColor('#36596A'),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Main_screen');
                  },
                  child: const Text('Start Shopping',style: TextStyle(fontSize: 16,color: Colors.white),),
                ),
              )
            ],
          )
        ],
      ),
    );

  }
}

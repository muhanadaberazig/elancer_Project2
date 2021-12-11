import 'package:elancer_api/get/home_getx_controler.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      String route =SharedPrefController().loggedIn? '/Main_screen':'/Out_bording_screen';
    Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('images/lunch.png',fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
    );
  }
}

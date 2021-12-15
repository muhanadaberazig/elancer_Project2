import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:elancer_api/screens/auth/login_screen.dart';
import 'package:elancer_api/screens/auth/password/change_passord.dart';
import 'package:elancer_api/screens/auth/password/forget_password_screen.dart';
import 'package:elancer_api/screens/auth/password/reset_verification.dart';
import 'package:elancer_api/screens/auth/password/verification.dart';
import 'package:elancer_api/screens/auth/register_screen.dart';
import 'package:elancer_api/screens/bn_screen/card.dart';
import 'package:elancer_api/screens/bn_screen/mainscreen.dart';
import 'package:elancer_api/screens/bn_screen/profile/profile.dart';
import 'package:elancer_api/screens/bn_screen/profile/aboute.dart';
import 'package:elancer_api/screens/bn_screen/profile/fqa_screen.dart';
import 'package:elancer_api/screens/bn_screen/profile/ticket_screen.dart';
import 'package:elancer_api/screens/category_screen.dart';
import 'package:elancer_api/screens/home_page_screen.dart';
import 'package:elancer_api/screens/launch_screen.dart';
import 'package:elancer_api/screens/welcomescreen.dart';
import 'package:elancer_api/screens/out_Bording_Screen.dart';
import 'package:elancer_api/screens/prodect_details_screen.dart';
import 'package:elancer_api/screens/sup_category_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await SharedPrefController().initPref();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      builder: () => MaterialApp(
        initialRoute:'/launch_screen',
        routes: {
          '/launch_screen': (context) => LaunchScreen(),
          '/Out_bording_screen': (context) => OutBordingScreen(),
          // -------------------------------Login--------------------------
          '/login_screen': (context) => LoginScreen(),
          '/forget_password_screen': (context) => ForgetPasswordScreen(),
          '/welcome_screen': (context) => WelcomeScreen(),
          '/register_screen': (context) => RegisterScreen(),
          '/Main_screen': (context) => MainScreen(),
          // -------------------------'Profile'---------------------------
          '/aboute_screen': (context) => AbouteScreen(),
          '/fqa_screen': (context) => FQAScreen(),
          '/ticket_screen': (context) => TicketScreen(),
          '/profile_screen': (context) => ProfileScreen(),
          '/changep_assword_screen': (context) => ChangePassword(),
          // -------------------------'Profile'---------------------------
          // -------------------------'home'---------------------------
          '/HomePage_screen': (context) => HomePage(),
          '/category_screen': (context) => CategoryScreen(),
          '/basket_screen': (context) => CartScreen(),


        },
      ),
    );
  }
}

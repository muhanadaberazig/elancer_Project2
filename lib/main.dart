import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:elancer_api/screens/auth/login_screen.dart';
import 'package:elancer_api/screens/auth/password/change_passord.dart';
import 'package:elancer_api/screens/auth/password/forget_password_screen.dart';
import 'package:elancer_api/screens/auth/password/verification.dart';
import 'package:elancer_api/screens/auth/register_screen.dart';
import 'package:elancer_api/screens/bn_screen/card.dart';
import 'package:elancer_api/screens/bn_screen/mainscreen.dart';
import 'package:elancer_api/screens/bn_screen/profile.dart';
import 'package:elancer_api/screens/categories_screen.dart';
import 'package:elancer_api/screens/category_screen.dart';
import 'package:elancer_api/screens/category_screen_final.dart';
import 'package:elancer_api/screens/launch_screen.dart';
import 'package:elancer_api/screens/login_signup.dart';
import 'package:elancer_api/screens/sup_category.dart';
import 'package:elancer_api/screens/out_Bording_Screen.dart';
import 'package:elancer_api/screens/prodect_screen.dart';
import 'package:elancer_api/screens/users_screen.dart';
import 'package:elancer_api/screens/wdget/sup_category_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      builder: () => MaterialApp(
        initialRoute:'/launch_screen',
        routes: {
          '/launch_screen': (context) => LaunchScreen(),
          '/Out_bording_screen': (context) => OutBordingScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/HomePage_screen': (context) => HomePage(),
          '/register_screen': (context) => RegisterScreen(),
          '/Main_screen': (context) => MainScreen(),
          '/forget_password_screen': (context) => ForgetPasswordScreen(),
          // '/categories_screen': (context) => CategoriesScreen(),
          '/loginsignup_screen': (context) => LoginSignUp(),
          '/category_screen': (context) => CategoryScreen(),
          '/sup_category_screen': (context) => SupCategory(),
          '/basket_screen': (context) => CartScreen(),
          '/profile_screen': (context) => ProfileScreen(),
          '/changep_assword_screen': (context) => ChangePassword(),
          // '/verification_screen': (context) => VerificationScreen(),
          '/product_screen': (context) => ProductScreen(),

        },
      ),
    );
  }
}

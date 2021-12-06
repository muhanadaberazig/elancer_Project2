import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elancer_api/models/bn_screen.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:elancer_api/screens/bn_screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/bn_screen.dart';
import '../../prefs/shared_pref_controller.dart';
import '../categories_screen.dart';
import '../category_screen_final.dart';
import 'card.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<BnScreen> _bnScreen = <BnScreen>[
    BnScreen(title: 'Home', widget: HomePage()),
    BnScreen(title: 'Cart', widget: CartScreen()),
    BnScreen(title: 'Profile', widget: ProfileScreen()),
  ];
  int _curantIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d3447),
        elevation: 0,
        title: Text(_bnScreen[_curantIndex].title,
            style: TextStyle(color: Colors.black, fontSize: 20)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedPrefController().clear();
                Navigator.pushReplacementNamed(context, '/login_screen');
              },
              icon: Icon(Icons.logout,color: Colors.black,)),
        ],
      ),
      body: _bnScreen[_curantIndex].widget,
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (int value) {
          setState(() {
            _curantIndex = value;
          });
        },
        backgroundColor: Color(0xFF2d3447),
        index: _curantIndex,
        color: HexColor('#36596A'),
        height: 50.h,
        items: const [
          Icon(Icons.home,),
          Icon(Icons.shopping_cart),
          Icon(Icons.person),
        ],
      ),
    );
  }
}

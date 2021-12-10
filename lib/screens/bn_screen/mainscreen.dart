import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elancer_api/api/auth_api_controller.dart';
import 'package:elancer_api/models/bn_screen.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:elancer_api/screens/bn_screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/bn_screen.dart';
import '../../prefs/shared_pref_controller.dart';
import '../categories_screen.dart';
import '../category_screen_final.dart';
import 'card.dart';
import 'profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool logout = false;
  final List<BnScreen> _bnScreen = <BnScreen>[
    BnScreen(title: 'Home', widget: HomePage()),
    BnScreen(title: 'Favorite', widget: CartScreen()),
  ];
  int _curantIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color(0xFF2d3551),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 90.0.w,
                    height: 90.0.h,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 24.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('images/logo.png')
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: const Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: const Text(
                    "Phone",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20.h,),
                Divider(
                  color: HexColor('#36596A'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile_screen');
                  },
                  leading: Icon(Iconsax.home),
                  title: Text('My Account'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Language",
                  ),
                  trailing: Text("en"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/fqa_screen');
                  },
                  leading: const Icon(Iconsax.message_question),
                  title: const Text('FQA'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/ticket_screen');
                  },
                  leading: const Icon(Iconsax.message),
                  title: const Text('Sending a Message'),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Divider(color: HexColor('#36596A')),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/aboute_screen');

                  },
                  leading: const Icon(Iconsax.info_circle5),
                  title: const Text('About'),
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      logout = true;
                    });
                    SharedPrefController().loggout;
                    if(await AuthApi().logout())
                    {
                      Navigator.of(context).pushNamed("/login_screen");
                    }
                  },
                  child:  const ListTile(
                    leading: Icon(Iconsax.logout),
                    title: Text(
                      "Logout",
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Rika 1.0.0',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Iconsax.close_square5 : Iconsax.menu5,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          backgroundColor: Color(0xFF2d3447),
          elevation: 0,
          title: Text(_bnScreen[_curantIndex].title,
              style: TextStyle(color: Colors.black, fontSize: 20)),
          centerTitle: true,

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
            Icon(Icons.home,size: 30,),
            Icon(Iconsax.lovely5,size: 30,),
          ],
        ),
      ),
    );
  }
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

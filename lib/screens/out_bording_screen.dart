import 'package:elancer_api/widgets/out_bording_contentent.dart';
import 'package:elancer_api/widgets/out_bording_lndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OutBordingScreen extends StatefulWidget {
  const OutBordingScreen({Key? key}) : super(key: key);

  @override
  _OutBordingScreenState createState() => _OutBordingScreenState();
}

class _OutBordingScreenState extends State<OutBordingScreen> {
  late PageController _pageController;
  int _curentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
         children: [
          Column(
             children: [
               ConstrainedBox(
                 constraints: BoxConstraints(
                   maxWidth: 520.w,
                   maxHeight: 700.h,
                   minHeight: 0,
                   minWidth: 0,
                 ),
                 child: PageView(
                   controller: _pageController,
                   onPageChanged: (value) {
                     setState(() {
                       _curentPage = value;
                     });
                   },
                   children: [
                     OutBordingContentet(
                       image: 'images/image.png',
                       text: '20% Discount \nNew Arrival Product',
                       hinttext: 'Publish up your selfies to make yourself \nmore beautiful with this app.',
                     ),
                     OutBordingContentet(
                       image: 'images/imagee.png',
                       text: 'Take Advantage\nOf The Offer Shopping',
                       hinttext: 'Publish up your selfies to make yourself \nmore beautiful with this app.',
                     ),
                     OutBordingContentet(
                       image: 'images/ouut.png',
                       text: 'All Types Offers\nWithin Your Reach',
                       hinttext: 'Publish up your selfies to make yourself \nmore beautiful with this app.',

                     ),
                   ],
                 ),
               ),
               Padding(
                 padding:  EdgeInsets.only(left: 20.w),
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       /* ال3 ازرار التنقل بين الصفحات الي تحت*/
                       OutBoardingIndicator(
                         selected: _curentPage == 0,
                         margin: 7.w,
                       ),
                       OutBoardingIndicator( margin:7.w ,selected: _curentPage == 1),
                       OutBoardingIndicator(selected: _curentPage == 2,margin: 0,),
                       SizedBox(width: 230.w),
                       Container(
                           width: 60.w,
                           height: 60.h,
                           child: Padding(
                             padding: const EdgeInsets.only(right: 10),
                             child: InkWell(
                                 onTap: () {
                                   Navigator.pushReplacementNamed(context, '/login_screen');
                                 },
                                 child: Image.asset('images/arrow.png')),
                           ))
                     ]),
               ),
             ],
           ),
         ],
        ),
      );
  }
}

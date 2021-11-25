import 'package:elancer_api/widgets/out_bording_contentent.dart';
import 'package:elancer_api/widgets/out_Bording_Indicator.dart';
import 'package:flutter/material.dart';
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
    return
      Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Visibility(
                  visible: _curentPage<2,
                  /* لوبدي استبدل الزر  لما يصير اكبر من2 بزر تاني*/
                  // replacement: TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'SKIP',
                  //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  //   ),
                  // ),,
                  child: Align(

                    alignment: AlignmentDirectional.topEnd,
                    child: TextButton(
                      onPressed: ()=>_pageController.animateToPage(2, duration: Duration(seconds: 1), curve: Curves.ease),
                      child: Text(
                        'SKIP',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 600,
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
                      image: Image.asset('images/Technologies.png'),
                      text: 'Mohanad Technologies',
                    ),
                    OutBordingContentet(
                      image: Image.asset('images/Workflow.png'),
                      text: 'Mohanad Working',
                    ),
                    OutBordingContentet(
                      image: Image.asset('images/Workflow.png'),
                      text: 'Mohanad Message Send',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      color: _curentPage > 0 ? Colors.black : Colors.grey,
                      onPressed: () {
                        _pageController.previousPage(
                            duration: Duration(seconds: 1), curve: Curves.ease);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  /*كود لاخفاء الزر لما يكون اكبر من 2*/
                  Visibility(
                    visible: _curentPage < 2,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: IconButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(seconds: 1), curve: Curves.ease);
                        },
                        icon: Icon(Icons.arrow_forward_ios)),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /* ال3 ازرار التنقل بين الصفحات الي تحت*/
                outBoardingIndicator(
                  margin: 10,
                  selected: _curentPage == 0,
                ),
                outBoardingIndicator(margin: 10, selected: _curentPage == 1),
                outBoardingIndicator(selected: _curentPage == 2),
              ]),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: _curentPage == 2,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () =>Navigator.pushReplacementNamed(context, '/LoginScreens'),
                    child: Text('START'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}

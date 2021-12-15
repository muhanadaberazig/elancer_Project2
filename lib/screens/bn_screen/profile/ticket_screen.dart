import 'package:elancer_api/api/controllers/qa_api_controller.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';


class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> with Helpers {
  late TextEditingController _textEditingController;
  late TextEditingController _maseegeTextEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _maseegeTextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _maseegeTextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF2d3447),
      appBar: AppBar(
        backgroundColor:    Color(0xFF2d3447),
        elevation: 0,
        title: const Text('Sending A Message'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w,vertical: 20.h),

                   child:  Text(
                      "Hey,do you have any questions or comments,send them to us?",
                      style: TextStyle(
                          color: HexColor('#36596A'),
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),

              ),
            ),
            Container(
                width: 330.w,
                height: 200.h,
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Subject",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppTextField(
                    hint: '',
                    controller: _textEditingController,
                    prefixIcon: Icons.add, label: '',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    "Message",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppTextField(
                    hint: '',
                    controller: _maseegeTextEditingController,
                    prefixIcon: Icons.add, label: '',
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.h),
                    child: ElevatedButton(
                      onPressed:() async => await performSendQ(),

                      child: Text(
                        "SEND",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60.h),
                        primary: HexColor('#36596A'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.w)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> performSendQ() async {
    if (checkData()) {
      await SENDQ();
    }
  }

  bool checkData() {
    if (_textEditingController.text.isNotEmpty&&_maseegeTextEditingController.text.isNotEmpty ) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> SENDQ() async {
    bool status = await QAApiController().sendQ(context,
        Subject: _textEditingController.text,
        Message: _maseegeTextEditingController.text);
    if (status) {
      clear();
    }
  }
  void clear(){
    _maseegeTextEditingController.clear();
    _textEditingController.clear();
  }
}

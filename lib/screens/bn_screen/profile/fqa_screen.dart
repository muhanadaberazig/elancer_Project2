import 'package:elancer_api/api/controllers/qa_api_controller.dart';
import 'package:elancer_api/models/api/api_fqa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';


class FQAScreen extends StatefulWidget {
  const FQAScreen({Key? key}) : super(key: key);

  @override
  _FQAScreenState createState() => _FQAScreenState();
}

class _FQAScreenState extends State<FQAScreen> {
  late TextEditingController _textEditingController;
   late Future<List<FAQs>> _future;
   List<FAQs> _categories = <FAQs>[];

  @override
  void initState() {
    _textEditingController = TextEditingController();
     _future = QAApiController().getFAQs();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor:    Color(0xFF2d3447),
        elevation: 0,
        title: const Text('Support &FAQS'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF2d3447),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child:
                Text(
                  " Frequently asked questions for users",
                  style: TextStyle(
                      color: HexColor('#36596A'),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: FutureBuilder<List<FAQs>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _categories = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: _categories.length,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: ListTile(
                          title: Text(
                            _categories[index].questionEn,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          subtitle: Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Text(
                              _categories[index].answerEn,
                              style: TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: HexColor('#36596A')),
                      );


                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      children: const [
                        Icon(Icons.warning, size: 80),
                        Text(
                          'NO DATA',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}

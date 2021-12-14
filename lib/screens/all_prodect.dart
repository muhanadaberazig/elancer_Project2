import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:elancer_api/get/sup_category_proubuct_getx_controler.dart';
import 'package:elancer_api/models/latest.dart';
import 'package:elancer_api/screens/prodect_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hexcolor/hexcolor.dart';
class AllProdect extends StatefulWidget {
  AllProdect({Key? key,required this.id}) : super(key: key);
  int id;
  @override
  _AllProdectState createState() => _AllProdectState();
}

class _AllProdectState extends State<AllProdect> {
  List<dynamic> contacts = [
    {

      'name': '1',
      'avatar': 'images/a525.jpg',
    },
    {
      'name': '2',
      'avatar': 'images/huawei2.jpg',
    },
    {
      'name': '3',
      'avatar': 'images/iphone1.jpg',
    },
    {
      'name': '4',
      'avatar': 'images/xiaomi_mi_11-15.jpg',
    },
    {
      'name': '4',
      'avatar': 'images/xiaomi_mi_11-15.jpg',
    },
    {
      'name': '2',
      'avatar': 'images/huawei2.jpg',
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SupCatPrpGetxController.to.getProduct(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        backgroundColor: Color(0xFF2d3447),
        elevation: 0,
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            children: [
              FadeInUp(
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: double.infinity,
                  height: 300.h,
                  padding: const EdgeInsets.all(90.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:HexColor('#36596A'), width: 10.0),
                  ),
                  child: Stack(
                    children: [
                      for (double i = 0; i < 360; i += 60)
                        AnimChain(
                            initialDelay: Duration(milliseconds: i.toInt())
                        )
                            .next(
                          wait: Duration(milliseconds: 1000),
                          widget: AnimatedAlignPositioned(
                            dx: 0,
                            dy: 150,
                            duration: Duration(seconds: 1),
                            rotateDegrees: 0,
                            touch: Touch.middle,
                            child: user(0, i),
                          ),
                        )
                            .next(
                          wait: Duration(seconds: 2),
                          widget: AnimatedAlignPositioned(
                            dx: i / 360,
                            dy: 150,
                            duration: Duration(seconds: 1),
                            rotateDegrees: i,
                            touch: Touch.middle,
                            child: user(0, i),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
              Obx(()
              {
                return  !SupCatPrpGetxController.to.loadingProduct.value &&
                    SupCatPrpGetxController.to.product.value.isNotEmpty
                    ?
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 15.h,
                  ),
                  itemCount: SupCatPrpGetxController.to.product.value.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                              id:  SupCatPrpGetxController.to.product.value[index].id,
                            ),
                          ),
                        );
                      },
                      child: Favourites(title: SupCatPrpGetxController.to.product[index].nameEn,imageUrl: SupCatPrpGetxController.to.product[index].imageUrl,price: 15,quantity: SupCatPrpGetxController.to.product[index].quantity,),
                    );
                  },
                ):
                !SupCatPrpGetxController.to.loadingProduct.value &&
                    SupCatPrpGetxController.to.product.value.isEmpty
                    ? Center(
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
                )
                    : Center(child: CircularProgressIndicator());
              }),
            ],
          ),
        ),
      ),
    );
  }
  user(int index, double number) {
    index = number ~/ 60;

    return FadeInRight(
      delay: Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: GestureDetector(
        onTap: () {
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(contacts[index]['avatar']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


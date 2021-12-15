import 'package:elancer_api/get/cotegory_getx_contrelor.dart';
import 'package:elancer_api/get/sup_category_proubuct_getx_controler.dart';
import 'package:elancer_api/models/latest.dart';
import 'package:elancer_api/screens/sup_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        title: Text('Category',),
        centerTitle: true,
        backgroundColor: Color(0xFF2d3447),
        elevation: 0,
      ),
      body:  ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Obx(()
            {
              return  !CategoryGetxControler.to.loadingsupCategory.value &&
                  CategoryGetxControler.to.category.value.isNotEmpty
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
                itemCount: CategoryGetxControler.to.category.value.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupCategory(
                            id:  CategoryGetxControler.to.category.value[index].id,
                          ),
                        ),
                      );
                    },
                    child: Favourites(title: CategoryGetxControler.to.category[index].nameEn,imageUrl: CategoryGetxControler.to.category.value[index].imageUrl,price: 15,quantity: 25,),
                  );
                },
              ):
              !CategoryGetxControler.to.loadingsupCategory.value &&
                  CategoryGetxControler.to.category.value.isEmpty
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
          ),
        ],

      ),
    );
  }
}

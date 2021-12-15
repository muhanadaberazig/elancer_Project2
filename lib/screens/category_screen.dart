import 'package:elancer_api/get/cotegory_getx_contrelor.dart';
import 'package:elancer_api/get/sup_category_proubuct_getx_controler.dart';
import 'package:elancer_api/models/latest.dart';
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
      body:  Obx(()
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
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => AllProdect(
              //         id:  CategoryGetxControler.to.category.value[index].id,
              //       ),
              //     ),
              //   );
              // },
              child: Favourites(title: SupCatPrpGetxController.to.supCategory[index].nameEn,imageUrl: SupCatPrpGetxController.to.supCategory[index].imageUrl,price: 15,quantity: SupCatPrpGetxController.to.supCategory[index].productsCount,),
            );
          },
        ):
        !SupCatPrpGetxController.to.loadingsupCategory.value &&
            SupCatPrpGetxController.to.supCategory.value.isEmpty
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
    );
  }
}

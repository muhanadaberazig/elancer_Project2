import 'package:elancer_api/api/controllers/home_api_controler.dart';
import 'package:elancer_api/api/controllers/update_profile_api_controler.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/city/model_city_todata.dart';
import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Helpers{
  late TextEditingController _nameTextController;
  late Future<List<CityData>> _future;
  List<CityData> city = [];
  bool createDrop=false;
  late CityData dropdownvalue ;
   String indexcity='1' ;

  // String _gender = SharedPrefController().gender;
  String _gender = SharedPrefController().gender;
  String _name   =SharedPrefController().name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController=TextEditingController();
    _nameTextController.text=_name;
    _future = HomeApiController().getCity();

  }
@override
  void dispose() {
    _nameTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2d3447),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/aboute_screen');
                },
                icon: Icon(
                  Icons.info,
                  size: 30,
                  color: HexColor('#36596A'),
                ))
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF2d3447),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(0.w),
                        bottom: Radius.circular(150.w),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: HexColor('#36596A'),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'images/avatar-1.png',
                        ),
                        backgroundColor: HexColor('#36596A'),
                        radius: 120,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 52.h,
                        ),
                        const Text(
                          "Name : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5.h,),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: _nameTextController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Divider(color: Color(0xFF2d3447) ,),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          "Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Male',style: TextStyle(fontSize: 17),),
                                contentPadding: EdgeInsets.zero,
                                value: 'M',
                                groupValue: _gender,
                                onChanged: (String? value) {
                                  if (value != null) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Female',style: TextStyle(fontSize: 17),),
                                contentPadding: EdgeInsets.zero,
                                value: 'F',
                                groupValue: _gender,
                                onChanged: (String? value) {
                                  if (value != null) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(color:  Color(0xFF2d3447),),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          "City :",
                          style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        FutureBuilder<List<CityData>>(
                          future: _future,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                              city = snapshot.data ?? [];
                              if(!createDrop) dropdownvalue=city.first;
                              return DropdownButton<CityData>(
                                value: dropdownvalue,
                                icon: Icon(Icons.keyboard_arrow_down),
                                underline: SizedBox(),
                                items: city.map((e) {
                                  return DropdownMenuItem<CityData>(child: Text(e.nameEn),value: e,);
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropdownvalue = value!;
                                    createDrop=true;
                                    indexcity=value.id.toString();
                                  });
                                },
                              );
                            }
                            else {
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

                        SizedBox(
                          height: 5.h,
                        ),
                        Divider(color:  Color(0xFF2d3447),),
                        ListTile(
                          leading: Icon(Icons.password,color:HexColor('#36596A') ,),
                          title:  TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/changep_assword_screen');
                              },
                              child: Text(
                                'Change Password  !',
                                style: TextStyle(fontSize: 20, color: HexColor('#36596A')),
                              )),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Divider(color:  Color(0xFF2d3447),),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(),
                          child: ElevatedButton(
                            onPressed: ()
                            async => await performUpdateProfile(),
                            child: Text(
                              "done",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 60.h),
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.w)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
  Future<void> performUpdateProfile() async {
    if (checkData()) {
      await UpdateProfile();

    }
  }
  Future<void> UpdateProfile() async {
    bool status = await UpdateProfileApiController().updateProfile(context,
        name: _nameTextController.text,
        cityId: indexcity,
        gender: _gender);
    if (status) {
      SharedPrefController().updateProfile(
          fullname: _nameTextController.text,
          genderM: _gender,
          cityData: dropdownvalue);
      // Navigator.pop(context);
    }
  }
  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
       indexcity.isNotEmpty &&
        _gender.isNotEmpty) {
      return true;

    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

}

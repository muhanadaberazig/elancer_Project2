import 'package:elancer_api/models/city/model_city_todata.dart';
import 'package:elancer_api/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn,loggout, name,id,cityEn,cityAr,them,language,mobile, password, gender, token }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required  User user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setBool(PrefKeys.loggout.toString(), true);
    await _sharedPreferences.setInt(PrefKeys.id.toString(),user.id);
    await _sharedPreferences.setString(PrefKeys.name.toString(),user.name);
    await _sharedPreferences.setString(PrefKeys.cityAr.toString(),user.city.nameAr);
    await _sharedPreferences.setString(PrefKeys.cityEn.toString(),user.city.nameEn);
    await _sharedPreferences.setString(PrefKeys.mobile.toString(), user.mobile);
    // await _sharedPreferences.setString(
    //     PrefKeys.password.toString(), user.password);
    await _sharedPreferences.setString(PrefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setString(PrefKeys.token.toString(), 'Bearer ' + user.token);
  }
  Future<void> updateProfile ({required String fullname,required String genderM,required CityData cityData  }) async {
    await _sharedPreferences.setString(PrefKeys.cityAr.toString(),cityData.nameAr);
    await _sharedPreferences.setString(PrefKeys.cityEn.toString(),cityData.nameEn);
    await _sharedPreferences.setString(PrefKeys.name.toString(),fullname);
    await _sharedPreferences.setString(PrefKeys.gender.toString(), genderM);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  bool get loggout =>
      _sharedPreferences.getBool(PrefKeys.loggout.toString()) ?? false;


  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  String get name =>
  _sharedPreferences.getString(PrefKeys.name.toString())??'';

  String get mobile =>
  _sharedPreferences.getString(PrefKeys.mobile.toString())??'';

  String get gender =>
  _sharedPreferences.getString(PrefKeys.gender.toString())??'';

  String get city  =>
  _sharedPreferences.getString(PrefKeys.cityAr.toString())??'';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}

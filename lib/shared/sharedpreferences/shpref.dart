

import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{

  static SharedPreferences? sharedPreferences;

  static Future<void> init()async{

    sharedPreferences = await SharedPreferences.getInstance() ;
  }

  
 static Future<bool> setBrightnessMode({required String key,required bool isLight})async{

      return await  sharedPreferences!.setBool(key, isLight);

  
 }
 static bool? getBrightnessMode({required String key}){

    return  sharedPreferences!.getBool(key);
 }




}
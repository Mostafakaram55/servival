import 'package:shared_preferences/shared_preferences.dart';

class Shared{
  static  SharedPreferences?  sharedPreferences;
  static init()async
  {
    sharedPreferences=await SharedPreferences.getInstance();//كده انا عرفته
  }
  //ازاي هنبعت ونستقبل بقيييي


//getData
  static  dynamic getDate({
    required String key,
  })
  {
    return sharedPreferences!.get(key);
  }
//saveData
  static Future<bool>saveData({
    required String key,
    required dynamic value,
  })async
  {
    if(value is String) return await sharedPreferences!.setString(key, value);
    if(value is int) return await sharedPreferences!.setInt(key, value);
    if(value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }
  //remove data
  static Future<bool> removeData({
    required String key,
  })async
  {
    return await  sharedPreferences!.remove(key);
  }

  static Future<bool> putBoolData({
    required key,
    required value,
  })async
  {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getBoolData({
    required String key,
  })
  {
    return  sharedPreferences!.getBool( key);
  }
}
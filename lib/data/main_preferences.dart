import 'package:shared_preferences/shared_preferences.dart';

class MainPreferences {
  SharedPreferences? _prefs;

  MainPreferences(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static Future<MainPreferences> getInstance() async {
    var prefs = await SharedPreferences.getInstance();
    return MainPreferences(prefs);
  }

  List<String>? getListString(String key) {
    return _prefs?.getStringList(key);
  }

  void setListString(String key, List<String> value) async {
    var currentValue = _prefs?.getStringList(key);
    if(currentValue != value){
      await _prefs?.remove(key);
      await _prefs?.setStringList(key, value);
    }
  }
}

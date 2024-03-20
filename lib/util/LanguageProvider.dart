
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier{

  Locale _locale = Locale("en");

  Locale get local => _locale;

  fetchLocal() async {

    var prefs = await SharedPreferences.getInstance();
    if(prefs.getString("lang") == null){
      _locale  = const Locale("en");
      return _locale;
    }
    _locale = Locale(prefs.getString("lang") ?? "en");
    return _locale;
  }

  void changeLang(Locale type) async {

    var prefs = await SharedPreferences.getInstance();
    if(_locale == type){
      return;
    }
    if(type == const Locale("en")){
      _locale = const Locale("en");
      await prefs.setString("lang", "en");
      await prefs.setString("countryCode", "US");
    }
    else {
      _locale = const Locale("km");
      await prefs.setString("lang", "km");
      await prefs.setString("countryCode", "KH");
    }
    notifyListeners();
  }

}
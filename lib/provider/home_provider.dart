import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../Api_handler/http_config.dart';
import '../model/country_model.dart';

class HomeProvider extends ChangeNotifier{

 final _service = HttpConfig();
  bool isLoading = false;
  List<String> _country = [];
  List<String> get country => _country;

 String  droupDownValue = "Select Country" ;
 String  droupDownStateValue = "Select State" ;

List<String> _states = [];
  List<String> get states => _states;

  Future<void> getAllCountryData() async {    
 Country  c1 = await _service.getCountryData();
 for(var item in c1.data){
_country.add(item.name);


for(var item2 in item.states){
  _states.add(item2.name);
}
 }
    notifyListeners();
   }

  void changeCountryValue(Object? value) {

    droupDownValue = value.toString();
    notifyListeners();
  }


  void changeStateValue(Object? value) {

    droupDownStateValue = value.toString();
    notifyListeners();
  }


}

import 'dart:convert';
import 'package:contry_demo/model/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpConfig{
  static const String API_BASE = "https://countriesnow.space/api/v0.1/countries/states";
getCountryData() async {
    final response = await http.get(
      Uri.parse(API_BASE),
    );
  if (response.statusCode == 200) {
     Country c1 =   Country.fromJson(jsonDecode(response.body));
    return c1;
}

    }


     





// for(var item in c1.data){
// country.add(item.name);
//state.add(item.states.toString());
      // List<Country> productModelList = [];
      // for (var singleProduct in  parsed) {


      //   print(singleProduct['data']['name']);
      // }
      //   Country productModel = Country(
            
      //        data: Datum(iso2: singleProduct['data']['iso2'],
      //         iso3: '', name: '', states: []), error: singleProduct, msg: '');
      //   productModelList.add(productModel);
      }
    



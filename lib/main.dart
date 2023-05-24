
import 'package:contry_demo/Api_handler/http_config.dart';
import 'package:contry_demo/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
       child :  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  MyHomePage(),
       )
        );
      }
    
  
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  String droupDownValue = "value 1";
    
  @override
  Widget build(BuildContext context) {
     Provider.of<HomeProvider>(context, listen: false).getAllCountryData();



    return
         Scaffold(
          body: 
          Consumer<HomeProvider>(builder: (context , providerObj , child){
return   Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
  providerObj.states.isEmpty ? Text("em"):
 SizedBox(
  width: 270,
   child: DropdownButton(
   hint: Text(providerObj.droupDownValue.toString() ),
                   icon: const Icon(Icons.keyboard_arrow_down),                    
                    items:  providerObj.states. map((items) {
                      return DropdownMenuItem(
                       value: items,
                        child: Text(items.isEmpty ? 'hello' : items.toString()),
                      );
                    }).toList(),
                     onChanged: (Object? value) { 
                     providerObj.changeCountryValue(value);
                     },
              
                    
   ),
 ),

 providerObj.country.isEmpty ? Text("em"):
 SizedBox(
  width: 270,
   child: DropdownButton(
   hint: Text(providerObj.droupDownStateValue.toString() ),
                   icon: const Icon(Icons.keyboard_arrow_down),                    
                    items:  providerObj.country. map((items) {
                      return DropdownMenuItem(
                       value: items,
                        child: Text(items.isEmpty ? 'hello' : items.toString()),
                      );
                    }).toList(),
                     onChanged: (Object? value) { 
                     providerObj.changeStateValue(value);
                     },
              
                    
   ),
 ),


//providerObj.country.isNotEmpty ?

//  DropdownButton(
//                     value: droupDownValue,
//                  icon: const Icon(Icons.keyboard_arrow_down),                    
//                   items:  providerObj.country. map((items) {
//                     print("----->$items");
//                     return DropdownMenuItem(
//                       value: items,
//                       child: Text(items),
//                     );
//                   }).toList(),
                  
                  
//                    onChanged: (Object? value) { 

//                     print("$value");
//                    },
            
                  
//  ):Text("data"),

              ],
            ),
          );

          
      })
    );
  }
  
}

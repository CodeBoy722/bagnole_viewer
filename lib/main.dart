import 'package:bagnole_viewer/bloc/CarsBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inject/inject.dart';

import 'di/bloc_injector.dart';
import 'di/bloc_module.dart';

void main() async {
  var container = await BlocInjector.create(BlocModule());
  runApp(container.app);
}

class MyApp extends StatelessWidget {
  final CarsBloc conSeptCars;
  @provide
  const MyApp({Key? key, required this.conSeptCars}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bagnole Viewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(conSeptCars: conSeptCars),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CarsBloc conSeptCars;
  const MyHomePage({Key? key, required this.conSeptCars}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState(conSeptCars: conSeptCars);
}

class _MyHomePageState extends State<MyHomePage> {
  final CarsBloc conSeptCars;
  _MyHomePageState({required this.conSeptCars});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(81, 52, 72, 1),
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),


      body: Column(

        children: [


        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //todo add new car
        },
        tooltip: 'Increment',
        backgroundColor: const Color.fromRGBO(81, 52, 72, 1),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

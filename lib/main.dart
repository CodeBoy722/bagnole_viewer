import 'package:bagnole_viewer/bloc/CarsBloc.dart';
import 'package:bagnole_viewer/controllers/State_controller.dart';
import 'package:bagnole_viewer/di/injection.dart';
import 'package:bagnole_viewer/ui/add_car_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'models/CarModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  ///init Di
  configureInjection(Env.prod);
  ///init firebase resources
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bagnole Viewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final carsBloc = getIt<CarsBloc>();
  final controller = getIt<StateController>();
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///bloc(viewModel) variable

  @override
  void initState() {
    /// getting an instance of bloc(viewModel)
    super.initState();
    //widget.carsBloc.fetAllMyCars();
  }

  @override
  void dispose() {
    /// disposing of bloc(viewModel)
    //widget.carsBloc.dispose();
    super.dispose();
  }

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

          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsetsDirectional.only(end: 16.0,start: 16.0, top: 0.0),
                alignment: Alignment.center,

                child: const Text( "Top Concept Cars 2030", textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "assets/fonts/Poppins-Bold.ttf",
                      color: Color.fromRGBO(81, 52, 72, 1),
                      fontWeight: FontWeight.w700
                  ),
                ),
              )
          ),

          Expanded(
            flex: 9,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsetsDirectional.only(end: 16.0,start: 16.0, top: 8.0),
                alignment: Alignment.center,

                child: StreamBuilder(
                  stream: widget.carsBloc.allCars,
                  builder: (context, AsyncSnapshot<List<CarModel>> snapshot){
                    if (snapshot.hasData) {
                      return buildList(snapshot);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              )
          )

        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(const AddCarDialog());
        },
        tooltip: 'Increment',
        backgroundColor: const Color.fromRGBO(81, 52, 72, 1),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildList(AsyncSnapshot<List<CarModel>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            shadowColor: const Color.fromRGBO(81, 52, 72, 1),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsetsDirectional.only(start: 8.0),
                      child: Image.asset(
                        snapshot.data!.elementAt(index).image,
                        fit: BoxFit.cover,
                        height: 95,
                        width: double.infinity,
                      ),
                    )
                  ),

                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [

                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsetsDirectional.only(start: 8.0),
                              child: Text(
                                snapshot.data!.elementAt(index).model,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "assets/fonts/Poppins-Bold.ttf",
                                    color: Color.fromRGBO(81, 52, 72, 1),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        ),

                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsetsDirectional.only(start: 8.0),
                              child: Text(
                                snapshot.data!.elementAt(index).series,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "assets/fonts/Poppins-Bold.ttf",
                                    color: Color.fromRGBO(81, 52, 72, 1),
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )
                        ),

                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsetsDirectional.only(start: 8.0),
                              child: Text(
                                snapshot.data!.elementAt(index).mark,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "assets/fonts/Poppins-Bold.ttf",
                                    color: Color.fromRGBO(81, 52, 72, 1),
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )
                        ),

                      ],
                    ),
                  ),

                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          snapshot.data!.elementAt(index).year,
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "assets/fonts/Poppins-Bold.ttf",
                              color: Color.fromRGBO(81, 52, 72, 1),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                  ),
                ],
              ),
            )


          );
        });
  }

}





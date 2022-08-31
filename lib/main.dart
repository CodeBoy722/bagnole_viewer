import 'package:bagnole_viewer/bloc/CarsBloc.dart';
import 'package:bagnole_viewer/bloc/CarsBloc_event.dart';
import 'package:bagnole_viewer/bloc/CarsBloc_state.dart';
import 'package:bagnole_viewer/controllers/State_controller.dart';
import 'package:bagnole_viewer/di/injection.dart';
import 'package:bagnole_viewer/resources/CarsDataProvider.dart';
import 'package:bagnole_viewer/resources/Repository.dart';
import 'package:bagnole_viewer/ui/add_car_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/CarModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('fr', ''), // french, no country code
      ],

      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(81, 52, 72, 1),
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),

      body: RepositoryProvider(
        create: (context) => Repository(getIt<FirestoreCarsService>()),
        child: BlocProvider(
          create: (context) => CarsBloc(context.read<Repository>()),
          child: Column(
            children: [

              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsetsDirectional.only(end: 8.0,start: 8.0),
                    alignment: Alignment.centerLeft,

                    child: Text( AppLocalizations.of(context)!.page_title,
                      textAlign: TextAlign.start,
                      style:  GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontSize: 20,
                          color: const Color.fromRGBO(81, 52, 72, 1),
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
              ),

              Expanded(
                  flex: 9,
                  child: Column(
                    children: [

                      Expanded(
                        flex: 1,
                          child: BlocBuilder<CarsBloc, CarsStreamState>(
                            builder: (context, state) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0),
                                height: double.infinity,

                                child: TextField(
                                  decoration:  InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: AppLocalizations.of(context)!.rea_year,
                                    suffixIcon: IconButton(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.magnifyingGlass,
                                        color: Color.fromRGBO(81, 52, 72, 1),
                                      ),
                                      onPressed: (){
                                        //context.read<CarsBloc>().add(GetCars());
                                      },
                                    )
                                  ),
                                  onChanged: (text){
                                    context.read<CarsBloc>().add(GetCarsByYear(queryYear: "2026"));
                                  },
                                ),
                              );
                            },
                          )),

                      Expanded(
                        flex: 1,
                          child: BlocBuilder<CarsBloc, CarsStreamState>(
                            builder: (context, state) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0),
                                height: double.infinity,
                                child: TextField(
                                  decoration:  InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: AppLocalizations.of(context)!.mark,
                                      suffixIcon: IconButton(
                                        icon: const FaIcon(
                                          FontAwesomeIcons.magnifyingGlass,
                                          color: Color.fromRGBO(81, 52, 72, 1),
                                        ),
                                        onPressed: (){

                                        },
                                      )
                                  ),
                                  onChanged: (text){
                                    context.read<CarsBloc>().add(GetCarsByMark(queryMark: "Volce"));
                                  },
                                ),
                              );
                            },
                          )
                      ),

                      Expanded(
                        flex: 8,
                          child: BlocBuilder<CarsBloc, CarsStreamState>(
                            builder: (context, state){
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                margin: const EdgeInsetsDirectional.only(end: 8.0,start: 8.0, top: 8.0),
                                alignment: Alignment.center,

                                child: StreamBuilder(
                                  ///get required stream from bloc state
                                  stream: state.carsStream,
                                  builder: (context, AsyncSnapshot<List<CarModel>> snapshot){
                                    if (snapshot.hasData) {
                                      return buildList(snapshot);
                                    } else if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    }
                                    return const Center(child: CircularProgressIndicator());
                                  },
                                ),
                              );
                            },
                          ),
                      )
                    ],
                  )
              )
            ],

          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(const AddCarDialog());
        },
        tooltip: "add a car",
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





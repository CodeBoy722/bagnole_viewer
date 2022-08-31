

import 'package:bagnole_viewer/models/CarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddCarDialog extends StatefulWidget{
  const AddCarDialog({Key? key}) : super(key: key);

  @override
  State<AddCarDialog> createState() => _AddCarDialogState();
}


class _AddCarDialogState extends State<AddCarDialog>{

  final _formKey = GlobalKey<FormState>();
  final _newCar = CarModel("", "", "", "", "");

  Future<void> saveNewCarToFirebase() async{
    CollectionReference carsCollection = FirebaseFirestore.instance.collection("concept_cars");

    return carsCollection.doc()
        .set({
      'model': _newCar.model,
      'series': _newCar.series,
      'mark': _newCar.mark,
      'year': _newCar.year,
      'image': _newCar.image,
    })
        .catchError((onError) => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to add new Concept Car")),
          )
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Container(
            height: 550,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.white,
            margin: const EdgeInsetsDirectional.only(end: 16.0,start: 16.0, top: 0.0),

            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,

              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                      child: Text( "Add New Concept Car", textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(81, 52, 72, 1),
                            fontWeight: FontWeight.w700
                        ),
                      ),
                  ),

                  Expanded(
                    flex: 1,
                    child:  TextFormField(
                      decoration: InputDecoration(
                        border:  const OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)!.concept_car_name,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.concept_car_name_error;
                        }else{
                          _newCar.model = value;
                        }
                        return null;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(60)
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child:  TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)!.series,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.series_error;
                        }else{
                          _newCar.series = value;
                        }
                        return null;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(60)
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child:  TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)!.mark,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.mark_error;
                        }else{
                          _newCar.mark = value;
                        }
                        return null;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(60)
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child:  TextFormField(
                      decoration:  InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)!.rea_year,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.rea_year_error;
                        }else{
                          _newCar.year = value;
                        }
                        return null;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(60)
                      ],
                    ),
                  ),

                  Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsetsDirectional.only(top: 8.0,bottom: 22.0),
                        height: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(81, 52, 72, 1),
                          boxShadow: const [
                            BoxShadow(color: Colors.white, spreadRadius: 3),
                          ],
                        ),

                        child: GestureDetector(
                          onTap: (){
                            /// implement image select
                          },
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 2,
                                  child: Text(
                                      "Select Car Image",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Color.fromRGBO(252, 178, 61, 1),
                                          fontWeight: FontWeight.w500)
                                  )
                              ),

                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    "assets/drawable/image_upload.png",
                                    height: 20,
                                    width: 20,
                                    color: const Color.fromRGBO(252, 178, 61, 1),
                                    alignment: Alignment.center,
                                  )
                              ),

                            ],
                          ),
                        ),
                      )
                  ),

                  Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsetsDirectional.only(top: 8.0,bottom: 22.0),
                        height: double.infinity,

                        child: TextButton(
                          onPressed: () async{
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("All good,saving your new Concept car")),
                              );
                              _newCar.image = "assets/drawable/volce_16.jpg";
                              await saveNewCarToFirebase();
                              Get.back();
                            }
                          },

                          style: TextButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(81, 52, 72, 1),
                              elevation: 3,
                              alignment: Alignment.center,
                              fixedSize: const Size(200, 25)
                          ),

                          child: const Text("Save Concept Car",
                              style: TextStyle(color: Color.fromRGBO(252, 178, 61, 1))
                          ),
                        ),
                      )
                  )

                ],
              ),
            )

        ),
      ),
    );

  }
  
}


import 'package:bagnole_viewer/models/CarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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

    return carsCollection.doc()//"r7sVBWiJ5gmdopM6i7tG"
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
            height: 400,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.white,
            margin: const EdgeInsetsDirectional.only(end: 24.0,start: 24.0, top: 0.0),

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
                            fontFamily: "assets/fonts/Poppins-Bold.ttf",
                            color: Color.fromRGBO(81, 52, 72, 1),
                            fontWeight: FontWeight.w700
                        ),
                      ),
                  ),

                  Expanded(
                    flex: 1,
                    child:  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Concept car name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a model name";
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Series",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a Series";
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Mark",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the car's Mark";
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Realization Year",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the year this car will be out";
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
                        width: 200,
                        margin: const EdgeInsetsDirectional.only(start: 16.0,end: 16.0,top: 8.0,bottom: 22.0),
                        height: 80,
                        child: TextButton(
                          onPressed: () async{
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Saving new Concept car")),
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

                          child: const Text("Save Car",
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
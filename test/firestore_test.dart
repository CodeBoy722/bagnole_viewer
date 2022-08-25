
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/CarModel.dart';

class FirestoreTest{

  Stream<List<CarModel>> get getCarsStream{
    return FirebaseFirestore.instance.collection("concept_cars").snapshots()
        .map((QuerySnapshot snapshot) =>
        snapshot.docs.map((QueryDocumentSnapshot queryDoc) =>
            CarModel(
                queryDoc.get("model"),
                queryDoc.get("series"),
                queryDoc.get("mark"),
                queryDoc.get("year"),
                queryDoc.get("image"))
        ).toList());
  }

  Future<StreamSubscription<QuerySnapshot<Object?>>> fetchMyCars() async{
    Stream<QuerySnapshot> carsCollection = FirebaseFirestore.instance.collection("concept_cars").snapshots();
    return carsCollection.listen((QuerySnapshot querySnapshot)  =>
        querySnapshot.docs.map((QueryDocumentSnapshot queryDoc) =>
            CarModel(
                queryDoc.get("model"),
                queryDoc.get("series"),
                queryDoc.get("mark"),
                queryDoc.get("year"),
                queryDoc.get("image"))
        ).toList());
  }


  List<CarModel> composeList() {
    List<CarModel> newCars = [];
    Stream<List<CarModel>> carsStream = getCarsStream;
    carsStream.listen((List<CarModel> cars) {
      for(CarModel car in cars){
        newCars.add(car);
      }
    });
    return newCars;
  }

}


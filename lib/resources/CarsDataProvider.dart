
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';

@Environment(Env.prod)
@injectable
@singleton
class FirestoreCarsService{

  /// talks with api/firebase to get list of top concept cars and return stream of List<CarModel>
  Stream<List<CarModel>> get fetchCarsStream{
    return FirebaseFirestore.instance.collection("concept_cars").snapshots()
        .map((QuerySnapshot snapshot) =>
        snapshot.docs.map((QueryDocumentSnapshot queryDoc) =>
            CarModel(
                model: queryDoc.get("model"),
                series: queryDoc.get("series"),
                mark: queryDoc.get("mark"),
                year: queryDoc.get("year"),
                image: queryDoc.get("image"))
        ).toList());
  }


  ///returns a stream of car model from firestore as per the queried year
  Stream<List<CarModel>> fetchCarsStreamByYear(String year) {
    return  FirebaseFirestore.instance.collection("concept_cars")//.snapshots()
        .where("year", isEqualTo: year).snapshots()
        .map((QuerySnapshot snapshot) =>
        snapshot.docs.map((QueryDocumentSnapshot queryDoc) =>
            CarModel(
                model: queryDoc.get("model"),
                series: queryDoc.get("series"),
                mark: queryDoc.get("mark"),
                year: queryDoc.get("year"),
                image: queryDoc.get("image"))
        ).toList());
  }

  ///returns a stream of car model from firestore as per the queried mark
  Stream<List<CarModel>> fetchCarsStreamByMark(String mark) {
    return FirebaseFirestore.instance.collection("concept_cars")
        .where("mark", isEqualTo: mark).snapshots()
        .map((QuerySnapshot snapshot) =>
        snapshot.docs.map((QueryDocumentSnapshot queryDoc) =>
            CarModel(
                model: queryDoc.get("model"),
                series: queryDoc.get("series"),
                mark: queryDoc.get("mark"),
                year: queryDoc.get("year"),
                image: queryDoc.get("image"))
        ).toList());
  }

  @disposeMethod
  dispose() {
    /// implement bloc dispose logic here
  }

}
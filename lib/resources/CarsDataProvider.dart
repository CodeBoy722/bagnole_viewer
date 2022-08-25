
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../models/CarModel.dart';

@injectable
@singleton
class CarsDataProvider{

  /// talks with api/firebase to get list of top concept cars and return stream of List<CarModel>
  Stream<List<CarModel>> get fetchCarsStream{
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
















/*final List<CarModel> cars = [

      CarModel(
          "Bagnolis 7",
          "Chakra",
          "Bagnolis",
          "2024",
          "assets/drawable/bagnolis_7_chakra.jpg"
      ),

      CarModel(
          "Dalf Runever 66",
          "66",
          "Dalf",
          "2030",
          "assets/drawable/dalf_runever_66.jpg"
      ),

      CarModel(
          "Doge Infinity Z",
          "Z",
          "Doge",
          "2026",
          "assets/drawable/doge_infinity_z.jpg"
      ),

      CarModel(
          "Rassalis Off-Road",
          "0ff-Road",
          "Rassalis",
          "2023",
          "assets/drawable/rassalis_off_road.jpg"
      ),

      CarModel(
          "Rieverendo XG24",
          "XG24",
          "Rieverendo",
          "2028",
          "assets/drawable/rieverendo_xg24.jpg"
      ),

      CarModel(
          "Russolini 9",
          "9",
          "Russolini",
          "2024",
          "assets/drawable/russolini_9.jpg"
      ),

      CarModel(
          "Spawn Eclair",
          "Eclair",
          "Spawn",
          "2022",
          "assets/drawable/spawn_eclair.jpg"
      ),

      CarModel(
          "Volce 16",
          "16",
          "Volce",
          "2026",
          "assets/drawable/volce_16.jpg"
      )

    ];*/

}
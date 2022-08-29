


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';

@Environment(Env.test)
@injectable
@singleton
class CarsDataProviderTest{

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


  @disposeMethod
  dispose() {
    /// implement bloc dispose logic here
  }

}
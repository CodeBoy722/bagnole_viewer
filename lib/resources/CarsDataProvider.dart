

import '../models/CarModel.dart';

class CarsDataProvider{

  Future<List<CarModel>> fetchMyCars() async{

    final List<CarModel> cars = [

      CarModel(
          "x95",
          "JkF45",
          "chevrolet",
          "Emmanuel"
      ),

      CarModel(
          "flown-18",
          "JkF19",
          "Nissan",
          "Emmanuel"
      ),

      CarModel(
          "excaflown-16",
          "C-nanda",
          "Bugatti",
          "Emmanuel"
      ),

      CarModel(
          "excaflown-18",
          "X-nanda",
          "Bugatti",
          "Emmanuel"
      ),

    ];

    return cars;
  }


}


import '../models/CarModel.dart';

class CarsDataProvider{

  Future<List<CarModel>> fetchMyCars() async{

    final List<CarModel> cars = [

      CarModel(
          "Bagnolis 7",
          "Chakra",
          "Bagnolis",
          "2024",
          "assets/drawable/bagnolis_7_chakra"
      ),

      CarModel(
          "Dalf Runever 66",
          "66",
          "Dalf",
          "2030",
          "assets/drawable/dalf_runever_66"
      ),

      CarModel(
          "Doge Infinity Z",
          "Z",
          "Doge",
          "2026",
          "assets/drawable/doge_infinity_z"
      ),

      CarModel(
          "Rassalis Off-Road",
          "0ff-Road",
          "Rassalis",
          "2023",
          "assets/drawable/rassalis_off_road"
      ),

      CarModel(
          "Rieverendo XG24",
          "XG24",
          "Rieverendo",
          "2028",
          "assets/drawable/rieverendo_xg24"
      ),

      CarModel(
          "Russolini 9",
          "9",
          "Russolini",
          "2024",
          "assets/drawable/russolini_9"
      ),

      CarModel(
          "Spawn Eclair",
          "Eclair",
          "Spawn",
          "2022",
          "assets/drawable/spawn_eclair"
      ),

      CarModel(
          "Volce 16",
          "16",
          "Volce",
          "2026",
          "assets/drawable/volce_16"
      )

    ];

    return cars;
  }


}
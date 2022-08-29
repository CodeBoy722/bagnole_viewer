
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';
import '../resources/Repository.dart';

@Environment(Env.prod)
@injectable
@singleton
class CarsBloc {
  /// cars provider initialization with by dependency injection
  final Repository _repo;
  Stream<List<CarModel>> get allCars => _repo.fetchAllMyCars();

  CarsBloc(this._repo);

  @disposeMethod
  dispose() {
    /// implement bloc dispose logic here
  }

}

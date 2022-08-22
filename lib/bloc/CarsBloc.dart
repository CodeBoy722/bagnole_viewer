
import 'package:rxdart/rxdart.dart';
import '../models/CarModel.dart';
import '../resources/Repository.dart';

class CarsBloc {
  final _repo = Repository();
  final _carsFetcher = PublishSubject<List<CarModel>>();
  Stream<List<CarModel>> get allCars => _carsFetcher.stream;

  fetAllMyCars() async {
    List<CarModel> cars = await _repo.fetchAllMyCars();
    _carsFetcher.sink.add(cars);
  }

  dispose() {
    _carsFetcher.close();
  }

}

final bloc = CarsBloc();
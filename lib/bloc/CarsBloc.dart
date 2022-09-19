
import 'package:bagnole_viewer/bloc/CarsBloc_event.dart';
 import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';
import '../resources/Repository.dart';
import 'CarsBloc_state.dart';

@Environment(Env.prod)
@injectable
@singleton
class CarsBloc extends Bloc<CarsEvent, CarsStreamState> with HydratedMixin{
  final Repository _repo;
  //Stream<List<CarModel>> get allCars => _repo.fetchAllMyCars();

  CarsBloc(this._repo) : super(const CarsStreamState( carsStream: null)){
    on<GetCars>(mapNewStreamEventToState);
    on<GetCarsByYear>(mapNewStreamByYearToState);
    on<GetCarsByMark>(mapNewStreamByMarkToState);
  }

  void mapNewStreamEventToState(GetCars event, Emitter<CarsStreamState> emit) {
    emit(state.sendStreamState(newStream: null));
    Stream<List<CarModel>> allCars = _repo.fetchAllMyCars();
    emit(state.sendStreamState(newStream: allCars));
  }

  void mapNewStreamByYearToState(GetCarsByYear event, Emitter<CarsStreamState> emit) {
    emit(state.sendStreamState(newStream: null));
    Stream<List<CarModel>> carsByYear = _repo.fetchCarsByYear(event.queryYear);
    emit(state.sendStreamState(newStream: carsByYear));
  }

  void mapNewStreamByMarkToState(GetCarsByMark event, Emitter<CarsStreamState> emit){
    emit(state.sendStreamState(newStream: null));
    Stream<List<CarModel>> carsByMark = _repo.fetchCarsByMark(event.queryMark);
    emit(state.sendStreamState(newStream: carsByMark));
  }


  @disposeMethod
  dispose() {
    /// implement bloc dispose logic here
  }

  @override
  CarsStreamState? fromJson(Map<String, dynamic> json) {
   return CarsStreamState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CarsStreamState state) {
   return state.toMap();
  }

}

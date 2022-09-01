import 'package:bagnole_viewer/models/CarModel.dart';
import 'package:equatable/equatable.dart';

class CarsStreamState extends Equatable{
  const CarsStreamState({
     required this.carsStream,
  });

  final Stream<List<CarModel>>? carsStream;

  @override
  List<Object> get props => [carsStream != null];

  CarsStreamState sendStreamState({ required Stream<List<CarModel>>? newStream}) {
    return CarsStreamState(
      carsStream: newStream,
    );
  }

}
import 'package:bagnole_viewer/models/CarModel.dart';
import 'package:equatable/equatable.dart';

class CarsStreamState extends Equatable{

  final Stream<List<CarModel>>? carsStream;

  @override
  List<Object> get props => [carsStream != null];

  CarsStreamState sendStreamState({ required Stream<List<CarModel>>? newStream}) {
    return CarsStreamState(
      carsStream: newStream,
    );
  }


  const CarsStreamState({
    this.carsStream,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarsStreamState &&
          runtimeType == other.runtimeType &&
          carsStream == other.carsStream);

  @override
  int get hashCode => carsStream.hashCode;

  @override
  String toString() {
    return 'CarsStreamState{ carsStream: $carsStream,}';
  }

  CarsStreamState copyWith({Stream<List<CarModel>>? carsStream,}) {
    return CarsStreamState(
      carsStream: carsStream ?? this.carsStream,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carsStream': carsStream,
    };
  }

  factory CarsStreamState.fromMap(Map<String, dynamic> map) {
    return CarsStreamState(
      carsStream: map['carsStream'] as Stream<List<CarModel>>,
    );
  }

}
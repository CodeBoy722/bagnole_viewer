

import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel{

   String model = "";
   String series = "";
   String mark = "";
   String year = "";
   String image = "";

//<editor-fold desc="Data Methods">

   CarModel({
    required this.model,
    required this.series,
    required this.mark,
    required this.year,
    required this.image,
  });

   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarModel &&
          runtimeType == other.runtimeType &&
          model == other.model &&
          series == other.series &&
          mark == other.mark &&
          year == other.year &&
          image == other.image);

   @override
  int get hashCode =>
      model.hashCode ^
      series.hashCode ^
      mark.hashCode ^
      year.hashCode ^
      image.hashCode;

   @override
  String toString() {
    return 'CarModel{ model: $model, series: $series, mark: $mark, year: $year, image: $image,}';
  }

   CarModel copyWith({
    String? model,
    String? series,
    String? mark,
    String? year,
    String? image,
  }) {
    return CarModel(
      model: model ?? this.model,
      series: series ?? this.series,
      mark: mark ?? this.mark,
      year: year ?? this.year,
      image: image ?? this.image,
    );
  }

   Map<String, dynamic> toMap() {
    return {
      'model': model,
      'series': series,
      'mark': mark,
      'year': year,
      'image': image,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      model: map['model'] as String,
      series: map['series'] as String,
      mark: map['mark'] as String,
      year: map['year'] as String,
      image: map['image'] as String,
    );
  }


//</editor-fold>
}
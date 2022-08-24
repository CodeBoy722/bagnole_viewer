

import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel{

   String model = "";
   String series = "";
   String mark = "";
   String year = "";
   String image = "";

  CarModel(this.model, this.series, this.mark, this.year, this.image);

  /* factory CarModel.fromSnapshot(QueryDocumentSnapshot snapshot) {
      CarModel car = CarModel.fromJson(snapshot);
      return car;
   }

   factory CarModel.fromJson(Map<String, dynamic> json) =>
       _carModelFromJson(json);

   Map<String, dynamic> toJson() => _carModelToJson(this);

   @override
   String toString() => 'Car Model $model';
}

CarModel _carModelFromJson(QueryDocumentSnapshot data) {
   return CarModel(
      data['model'],
      data['series'],
      data['mark'],
      data['year'],
      data['image'],
   );
}

Map<String, dynamic> _carModelToJson(CarModel instance) {
   return {
      'model' : instance.model,
      'series': instance.series,
      'mark': instance.mark,
      'year': instance.year,
      'image': instance.image,
   };
}*/


}
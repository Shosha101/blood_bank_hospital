// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      areaName: json['areaName'] as String,
      minimumBloodQuantityByLiter: (json['minimumBloodQuantityByLiter'] as num)
          .toInt(),
    );

Map<String, dynamic> _$HospitalModelToJson(HospitalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'areaName': instance.areaName,
      'minimumBloodQuantityByLiter': instance.minimumBloodQuantityByLiter,
    };

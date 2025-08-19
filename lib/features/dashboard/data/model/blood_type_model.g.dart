// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodTypeModel _$BloodTypeModelFromJson(Map<String, dynamic> json) =>
    BloodTypeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BloodTypeModelToJson(BloodTypeModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

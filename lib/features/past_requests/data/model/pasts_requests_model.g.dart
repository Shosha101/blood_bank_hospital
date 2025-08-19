// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasts_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PastsRequestsModel _$PastsRequestsModelFromJson(Map<String, dynamic> json) =>
    PastsRequestsModel(
      id: (json['id'] as num).toInt(),
      bloodTypeName: json['bloodTypeName'] as String,
      numOfLiter: (json['numOfLiter'] as num).toInt(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$PastsRequestsModelToJson(PastsRequestsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bloodTypeName': instance.bloodTypeName,
      'numOfLiter': instance.numOfLiter,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };

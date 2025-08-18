// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveRequestsModel _$ActiveRequestsModelFromJson(Map<String, dynamic> json) =>
    ActiveRequestsModel(
      id: (json['id'] as num).toInt(),
      bloodTypeName: json['bloodTypeName'] as String,
      numOfLiter: (json['numOfLiter'] as num).toInt(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ActiveRequestsModelToJson(
  ActiveRequestsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'bloodTypeName': instance.bloodTypeName,
  'numOfLiter': instance.numOfLiter,
  'status': instance.status,
  'createdAt': instance.createdAt,
};

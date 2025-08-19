// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationRequestModel _$DonationRequestModelFromJson(
  Map<String, dynamic> json,
) => DonationRequestModel(
  id: (json['id'] as num?)?.toInt(),
  bloodTypeId: (json['bloodTypeId'] as num?)?.toInt(),
  bloodTypeName: json['bloodTypeName'] as String?,
  numOfLiter: (json['numOfLiter'] as num).toInt(),
  hospitalId: (json['hospitalId'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$DonationRequestModelToJson(
  DonationRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'bloodTypeId': instance.bloodTypeId,
  'bloodTypeName': instance.bloodTypeName,
  'numOfLiter': instance.numOfLiter,
  'hospitalId': instance.hospitalId,
  'status': instance.status,
  'createdAt': instance.createdAt,
};

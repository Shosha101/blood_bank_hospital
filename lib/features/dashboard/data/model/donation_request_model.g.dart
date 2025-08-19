// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationRequestModel _$DonationRequestModelFromJson(
  Map<String, dynamic> json,
) => DonationRequestModel(
  id: (json['id'] as num?)?.toInt(),
  hospitalId: (json['hospitalId'] as num?)?.toInt(),
  bloodTypeId: (json['bloodTypeId'] as num?)?.toInt(),
  bloodTypeName: json['bloodTypeName'] as String?,
  numOfLiter: (json['numOfLiter'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: DonationRequestModel._fromJsonDateTime(
    json['createdAt'] as String?,
  ),
);

Map<String, dynamic> _$DonationRequestModelToJson(
  DonationRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'hospitalId': instance.hospitalId,
  'bloodTypeId': instance.bloodTypeId,
  'bloodTypeName': instance.bloodTypeName,
  'numOfLiter': instance.numOfLiter,
  'status': instance.status,
  'createdAt': DonationRequestModel._toJsonDateTime(instance.createdAt),
};

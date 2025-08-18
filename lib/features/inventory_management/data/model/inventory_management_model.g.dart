// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_management_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) =>
    InventoryModel(
      id: (json['id'] as num).toInt(),
      bloodTypeName: json['bloodTypeName'] as String,
      currentQuantity: (json['currentQuantity'] as num).toInt(),
      expirationDate: json['expirationDate'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$InventoryModelToJson(InventoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bloodTypeName': instance.bloodTypeName,
      'currentQuantity': instance.currentQuantity,
      'expirationDate': instance.expirationDate,
      'status': instance.status,
    };


// lib/features/inventory_management/data/models/inventory_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'inventory_management_model.g.dart';

@JsonSerializable()
class InventoryModel {
  final int id;
  final String bloodTypeName;
  final int currentQuantity;
  final String expirationDate;
  final String status;

  InventoryModel({
    required this.id,
    required this.bloodTypeName,
    required this.currentQuantity,
    required this.expirationDate,
    required this.status,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryModelToJson(this);
}
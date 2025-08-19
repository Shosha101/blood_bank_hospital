
// lib/features/dashboard/data/models/blood_type_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'blood_type_model.g.dart';

@JsonSerializable()
class BloodTypeModel {
  final int id;
  final String name;

  BloodTypeModel({
    required this.id,
    required this.name,
  });

  factory BloodTypeModel.fromJson(Map<String, dynamic> json) =>
      _$BloodTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BloodTypeModelToJson(this);
}
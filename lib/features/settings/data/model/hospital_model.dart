import 'package:json_annotation/json_annotation.dart';

part 'hospital_model.g.dart';

@JsonSerializable()
class HospitalModel {
  final int id;
  final String name;
  final String phoneNumber;
  final String areaName;
  final int minimumBloodQuantityByLiter;

  HospitalModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.areaName,
    required this.minimumBloodQuantityByLiter,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) => _$HospitalModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalModelToJson(this);
}
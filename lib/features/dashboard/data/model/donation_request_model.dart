
// lib/features/dashboard/data/models/donation_request_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'donation_request_model.g.dart';

@JsonSerializable()
class DonationRequestModel {
  final int? id;
  final int? bloodTypeId;
  final String? bloodTypeName;
  final int numOfLiter;
  final int? hospitalId;
  final String? status;
  final String? createdAt;

  DonationRequestModel({
    this.id,
    this.bloodTypeId,
    this.bloodTypeName,
    required this.numOfLiter,
    this.hospitalId,
    this.status,
    this.createdAt,
  });

  factory DonationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DonationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => {
        if (bloodTypeId != null) 'bloodTypeId': bloodTypeId,
        'numOfLiter': numOfLiter,
        if (hospitalId != null) 'hospitalId': hospitalId,
      };
}
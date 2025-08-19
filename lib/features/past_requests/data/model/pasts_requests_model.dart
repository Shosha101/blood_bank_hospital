
// lib/features/past_requests/data/models/completed_requests_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'pasts_requests_model.g.dart';

@JsonSerializable()
class PastsRequestsModel {
  final int id;
  final String bloodTypeName;
  final int numOfLiter;
  final String status;
  final String createdAt;

  PastsRequestsModel({
    required this.id,
    required this.bloodTypeName,
    required this.numOfLiter,
    required this.status,
    required this.createdAt,
  });

  factory PastsRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$PastsRequestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PastsRequestsModelToJson(this);
}
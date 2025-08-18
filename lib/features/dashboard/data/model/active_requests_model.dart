
// lib/features/active_requests/data/models/active_request_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'active_requests_model.g.dart';

@JsonSerializable()
class ActiveRequestsModel {
  final int id;
  final String bloodTypeName;
  final int numOfLiter;
  final String status;
  final String createdAt;

  ActiveRequestsModel({
    required this.id,
    required this.bloodTypeName,
    required this.numOfLiter,
    required this.status,
    required this.createdAt,
  });

  factory ActiveRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveRequestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveRequestsModelToJson(this);
}
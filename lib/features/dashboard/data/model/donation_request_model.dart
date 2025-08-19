import 'package:json_annotation/json_annotation.dart';

part 'donation_request_model.g.dart';

@JsonSerializable()
class DonationRequestModel {
  final int? id;
  final int? hospitalId;
  final int? bloodTypeId;
  final String? bloodTypeName;
  final int? numOfLiter;
  final String? status;
  @JsonKey(fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
  final DateTime? createdAt;

  DonationRequestModel({
    this.id,
    this.hospitalId,
    this.bloodTypeId,
    this.bloodTypeName,
    this.numOfLiter,
    this.status,
    this.createdAt,
  });

  factory DonationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DonationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$DonationRequestModelToJson(this);

  static DateTime? _fromJsonDateTime(String? date) =>
      date != null ? DateTime.parse(date) : null;

  static String? _toJsonDateTime(DateTime? date) => date?.toIso8601String();
}
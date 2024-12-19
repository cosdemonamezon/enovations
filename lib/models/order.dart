import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int id;
  String? code;
  String? start_date;
  String? end_date;
  String? request_purpose;
  String? user_id;
  String? budget;
  String? function_qualifications;
  String? work_station_id;
  String? additional_equipment;
  String? meeting_details;
  String? current_machine_model;
  String? current_work_station;
  String? current_usage_problem;
  String? competitor_model;
  String? competitor_transducer;
  String? customer_feedback;
  String? client_id;
  String? customer_type;
  String? province;
  String? department;
  String? floor;
  String? kol_doctor;
  String? additional_info;
  String? status;

  Order(
      this.id,
      this.additional_equipment,
      this.additional_info,
      this.budget,
      this.client_id,
      this.code,
      this.competitor_model,
      this.competitor_transducer,
      this.current_machine_model,
      this.current_usage_problem,
      this.current_work_station,
      this.customer_feedback,
      this.customer_type,
      this.department,
      this.end_date,
      this.floor,
      this.function_qualifications,
      this.kol_doctor,
      this.meeting_details,
      this.province,
      this.request_purpose,
      this.start_date,
      this.status,
      this.user_id,
      this.work_station_id);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

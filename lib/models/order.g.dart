// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      (json['id'] as num).toInt(),
      json['additional_equipment'] as String?,
      json['additional_info'] as String?,
      json['budget'] as String?,
      (json['client_id'] as num?)?.toInt(),
      json['code'] as String?,
      json['competitor_model'] as String?,
      json['competitor_transducer'] as String?,
      json['current_machine_model'] as String?,
      json['current_usage_problem'] as String?,
      json['current_work_station'] as String?,
      json['customer_feedback'] as String?,
      json['customer_type'] as String?,
      json['department'] as String?,
      json['end_date'] as String?,
      json['floor'] as String?,
      json['function_qualifications'] as String?,
      json['kol_doctor'] as String?,
      json['meeting_details'] as String?,
      json['province'] as String?,
      json['request_purpose'] as String?,
      json['start_date'] as String?,
      json['status'] as String?,
      (json['user_id'] as num?)?.toInt(),
      (json['work_station_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'request_purpose': instance.request_purpose,
      'user_id': instance.user_id,
      'budget': instance.budget,
      'function_qualifications': instance.function_qualifications,
      'work_station_id': instance.work_station_id,
      'additional_equipment': instance.additional_equipment,
      'meeting_details': instance.meeting_details,
      'current_machine_model': instance.current_machine_model,
      'current_work_station': instance.current_work_station,
      'current_usage_problem': instance.current_usage_problem,
      'competitor_model': instance.competitor_model,
      'competitor_transducer': instance.competitor_transducer,
      'customer_feedback': instance.customer_feedback,
      'client_id': instance.client_id,
      'customer_type': instance.customer_type,
      'province': instance.province,
      'department': instance.department,
      'floor': instance.floor,
      'kol_doctor': instance.kol_doctor,
      'additional_info': instance.additional_info,
      'status': instance.status,
    };

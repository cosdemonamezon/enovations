// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['id'] as num).toInt(),
      json['user_no'] as String?,
      (json['permission_id'] as num?)?.toInt(),
      (json['department_id'] as num?)?.toInt(),
      (json['position_id'] as num?)?.toInt(),
      json['username'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['image'] as String?,
      json['status'] as String?,
      json['updated_at'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_no': instance.user_no,
      'permission_id': instance.permission_id,
      'department_id': instance.department_id,
      'position_id': instance.position_id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

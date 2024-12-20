// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books _$BooksFromJson(Map<String, dynamic> json) => Books(
      (json['id'] as num).toInt(),
      json['end_date'] as String?,
      json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
      (json['order_id'] as num?)?.toInt(),
      (json['product_id'] as num?)?.toInt(),
      json['start_date'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'product_id': instance.product_id,
      'type': instance.type,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'order': instance.order,
    };

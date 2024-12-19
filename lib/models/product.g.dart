// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      (json['id'] as num).toInt(),
      json['area_id'] as String?,
      json['book'] as String?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => Books.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['brand_id'] as String?,
      json['category_product_id'] as String?,
      json['code'] as String?,
      json['create_by'] as String?,
      json['detail'] as String?,
      json['machine_model_id'] as String?,
      json['name'] as String?,
      json['qty'] as String?,
      json['serial_no'] as String?,
      json['status'] as String?,
      json['update_by'] as String?,
      json['user_no'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'user_no': instance.user_no,
      'code': instance.code,
      'category_product_id': instance.category_product_id,
      'area_id': instance.area_id,
      'brand_id': instance.brand_id,
      'machine_model_id': instance.machine_model_id,
      'serial_no': instance.serial_no,
      'name': instance.name,
      'detail': instance.detail,
      'qty': instance.qty,
      'book': instance.book,
      'status': instance.status,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'books': instance.books,
    };

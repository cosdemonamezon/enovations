import 'package:json_annotation/json_annotation.dart';
import 'package:novations/models/books.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  String? user_no;
  String? code;
  int? category_product_id;
  int? area_id;
  String? brand_id;
  int? machine_model_id;
  String? serial_no;
  String? name;
  String? detail;
  String? qty;
  String? book;
  String? status;
  String? create_by;
  String? update_by;
  List<Books>? books;

  Product(this.id, this.area_id, this.book, this.books, this.brand_id, this.category_product_id, this.code, this.create_by, this.detail, this.machine_model_id, this.name, this.qty,
      this.serial_no, this.status, this.update_by, this.user_no);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

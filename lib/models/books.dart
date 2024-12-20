import 'package:json_annotation/json_annotation.dart';
import 'package:novations/models/order.dart';

part 'books.g.dart';

@JsonSerializable()
class Books {
  final int id;
  int? order_id;
  int? product_id;
  String? type;
  String? start_date;
  String? end_date;
  Order? order;

  Books(this.id, this.end_date, this.order, this.order_id, this.product_id, this.start_date, this.type);

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);

  Map<String, dynamic> toJson() => _$BooksToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  String? user_no;
  String? permission_id;
  String? department_id;
  String? position_id;
  String? username;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? status;
  String? created_at;
  String? updated_at;

  User(
    this.id,
    this.user_no,
    this.permission_id,
    this.department_id,
    this.position_id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.status,
    this.updated_at,
    this.created_at,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  void clear() {}
}

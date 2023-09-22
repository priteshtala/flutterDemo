import 'package:json_annotation/json_annotation.dart';

part 'department_model.g.dart';

@JsonSerializable()
class Department {
  int? id;
  String name;
  @JsonKey(name: "created_at")
  String createAt;
  @JsonKey(name: "updated_at")
  String updateAt;

  Department({required this.name, required this.createAt, required this.updateAt});

  factory Department.fromJson(Map<String, dynamic> data) => _$DepartmentFromJson(data);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

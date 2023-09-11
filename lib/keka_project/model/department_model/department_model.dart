import 'package:json_annotation/json_annotation.dart';

part 'department_model.g.dart';
@JsonSerializable()
class Department{
  String department;

  Department({required this.department});

  factory Department.fromJson(Map<String,dynamic> data) => _$DepartmentFromJson(data);

  Map<String,dynamic> toJson() => _$DepartmentToJson(this);
}
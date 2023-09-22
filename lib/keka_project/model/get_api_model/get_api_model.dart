import 'package:json_annotation/json_annotation.dart';

part 'get_api_model.g.dart';

@JsonSerializable()
class Employee {
  int id;
  String name;
  String role;
  String location;
  @JsonKey(name: "department_id")
  int departmentId;
  String email;
  @JsonKey(name: "mobile_no")
  String mobileNo;
  @JsonKey(name: "birth_date")
  DateTime birthDate;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  Departments department;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.location,
    required this.departmentId,
    required this.email,
    required this.mobileNo,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
    required this.department,
  });

  factory Employee.fromJson(Map<String, dynamic> data) => _$EmployeeFromJson(data);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

@JsonSerializable()
class Departments {
  int id;
  String name;
  @JsonKey(name: "created_at")
  dynamic createdAt;
  @JsonKey(name: "updated_at")
  dynamic updatedAt;

  Departments({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Departments.fromJson(Map<String, dynamic> data) => _$DepartmentsFromJson(data);

  Map<String, dynamic> toJson() => _$DepartmentsToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'employee_model.g.dart';
@JsonSerializable()
class EmployeeData {
  String name;
  String role;
  String location;
  String department;
  String email;
  String number;

  EmployeeData({
    required this.name,
    required this.role,
    required this.location,
    required this.department,
    required this.email,
    required this.number,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> data) => _$EmployeeDataFromJson(data);

  Map<String, dynamic> toJson() => _$EmployeeDataToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeData _$EmployeeDataFromJson(Map<String, dynamic> json) => EmployeeData(
      name: json['name'] as String,
      role: json['role'] as String,
      location: json['location'] as String,
      department: json['department'] as String,
      email: json['email'] as String,
      number: json['number'] as String,
    );

Map<String, dynamic> _$EmployeeDataToJson(EmployeeData instance) => <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'location': instance.location,
      'department': instance.department,
      'email': instance.email,
      'number': instance.number,
    };
